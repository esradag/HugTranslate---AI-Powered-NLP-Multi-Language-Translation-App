# HugTranslate - AI-Powered NLP Multi-Language Translation App

Built with **Python**, **Flask**, and **Hugging Face Transformers (M2M100 model)** for the backend and **Flutter** for the frontend, HugTranslate offers seamless real-time text translation with a modern and user-friendly interface for global communication.

## 🚀 Features
- Real-time text translation supporting multiple languages
- Source and target language selection
- User-friendly and responsive design
- Extendable features like speech translation and chat integration

## 🛠️ Technologies Used
- **Backend:** Python, Flask, Hugging Face Transformers (M2M100), Docker  
- **Frontend:** Flutter, HTTP Packages, Material Design

## 🔧 Installation

### Backend
1. Clone the repository:
   ```bash
   git clone https://github.com/username/hugtranslate.git
   cd hugtranslate/backend
Install dependencies:

    pip install -r requirements.txt
Run the server:
    
    python app.py
(Optional) Run with Docker:
     
     docker build -t hugtranslate-backend .
     docker run -p 5001:5001 hugtranslate-backend

## Frontend
## Install Flutter:  
Follow the [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

# HugTranslate - AI-Powered NLP Multi-Language Translation App

**HugTranslate** is an advanced language translation application powered by **Natural Language Processing (NLP)**. The backend leverages the **M2M100** translation model from **Hugging Face**, enabling seamless multi-language text translation. The Flutter-based frontend ensures a modern and user-friendly experience.

---

## ⭐ Features

- ⚡ Real-time text translation (supports 10 languages)
- 🌍 Source and target language selection
- 📱 Modern and user-friendly interface
- 🔄 Language swapping and translation history (extendable)
- 🔊 Speech translation and chat features (expandable)

## 🚀 Technologies Used

### 🔹 Backend

- Python
- Flask
- Hugging Face Transformers (M2M100 model)
- Docker

### 🔹 Frontend

- Flutter
- HTTP Packages
- Material Design

## 🔧 Installation

### 🔹 Backend Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/username/hugtranslate.git
   cd hugtranslate/backend
   ```
2. **Install Required Packages:**
   ```bash
   pip install -r requirements.txt
   ```
3. **Run the Backend Server:**
   ```bash
   python app.py
   ```
   **Note:** If using Docker:
   ```bash
   docker build -t hugtranslate-backend .
   docker run -p 5001:5001 hugtranslate-backend
   ```

### 🔹 Frontend Setup

1. **Install Flutter:**

   - [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

2. **Run the Flutter App:**

   ```bash
   cd hugtranslate/frontend
   flutter pub get
   flutter run
   ```

## 📡 API Usage

### 🔹 Translation Endpoint

- **URL:** `POST /translate`
- **Request Body:**
  ```json
  {
    "text": "Hello world",
    "source_lang": "en",
    "target_lang": "de"
  }
  ```
- **Response:**
  ```json
  {
    "translated_text": "Hallo Welt"
  }
  ```








     


