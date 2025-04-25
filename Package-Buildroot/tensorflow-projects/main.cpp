#include <opencv2/opencv.hpp>
#include <tensorflow/lite/c/c_api.h>
#include <iostream>
#include <vector>

int main() {
    // Charger le modèle sauvegardé
    const char* model_path = "model.tflite";
    // Note: TensorFlow C API does not have a direct load_model function like Keras.
    // You would need to load the model using TensorFlow C API functions.

    // Dictionnaire pour les classes (correspondant aux sous-dossiers : rock, paper, scissors)
    std::vector<std::string> class_labels = {"rock", "paper", "scissors"};

    // Initialiser la caméra
    cv::VideoCapture cap(0);  // 0 pour la caméra par défaut
    if (!cap.isOpened()) {
        std::cerr << "Échec de l'ouverture de la caméra" << std::endl;
        return -1;
    }
    std::cout << "Caméra lancée !" << std::endl; 
    while (true) {
        // Lire une image de la caméra
        cv::Mat frame;
        cap >> frame;

        // Vérifier si l'image a été capturée correctement
        if (frame.empty()) {
            std::cerr << "Échec de la capture de l'image" << std::endl;
            break;
        }

        // Redimensionner l'image à 64x64 pixels (taille attendue par le modèle)
        cv::Mat image;
        cv::resize(frame, image, cv::Size(64, 64));

        // Appliquer un flou gaussien pour réduire le bruit
        cv::GaussianBlur(image, image, cv::Size(5, 5), 0);

        // Normaliser les pixels
        image.convertTo(image, CV_32F, 1.0 / 255.0);

        // Ajouter une dimension pour correspondre à l'entrée du modèle (batch_size, height, width, channels)
        // Note: TensorFlow C API requires manual tensor creation and manipulation.

        // Faire une prédiction avec le modèle
        // Note: You would need to implement the prediction logic using TensorFlow C API.

        // Afficher le texte correspondant à la classe prédite
        // Assuming predicted_class is obtained from the model prediction
        int predicted_class = 0; // Placeholder for predicted class index
        cv::putText(frame, "Prediction: " + class_labels[predicted_class], cv::Point(10, 30),
                    cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 255, 0), 2, cv::LINE_AA);
	std::cout << "Prediction:" << class_labels[predicted_class] << std::endl;
        // Dessiner un cadre autour de l'image
        cv::rectangle(frame, cv::Point(10, 10), cv::Point(250, 250), cv::Scalar(0, 255, 0), 2);

        /*// Afficher l'image avec OpenCV
        cv::imshow("Gesture Recognition", frame);

        // Quitter si la touche 'q' est pressée
        if (cv::waitKey(1) == 'q') {
            break;
        }*/
    }

    // Libérer la caméra et fermer les fenêtres
    cap.release();
    //cv::destroyAllWindows();
    return 0;
}
