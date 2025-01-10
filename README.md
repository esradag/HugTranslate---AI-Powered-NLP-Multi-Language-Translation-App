# HugTranslate - AI-Powered NLP Multi-Language Translation App

**HugTranslate** is an advanced language translation application powered by **Natural Language Processing (NLP)**. The backend leverages the **M2M100** translation model from **Hugging Face**, enabling seamless multi-language text translation. The Flutter-based frontend ensures a modern and user-friendly experience.

---

## 📱 App Screenshots


<img width="200" alt="hugtranslate1" src="https://github.com/user-attachments/assets/309ac89d-4f0e-414e-a0b3-9056f8960bee" />

<img width="200" alt="hugtranslate2" src="https://github.com/user-attachments/assets/27651a1e-d98f-463f-a470-b42d6d90b7d8" />

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

### Backend

1. **Clone the repository:**
   ```bash
   git clone https://github.com/username/HugTranslate---AI-Powered-NLP-Multi-Language-Translation-App.git
   cd HugTranslate---AI-Powered-NLP-Multi-Language-Translation-App/backend
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Run the server:**
   ```bash
   python app.py
   ```

4. **(Optional) Run with Docker:**
   ```bash
   docker build -t hugtranslate-backend .
   docker run -p 5001:5001 hugtranslate-backend
   ```

---

### Frontend

1. **Install Flutter:**  
   Follow the [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

2. **Clone the repository:**
   ```bash
   git clone https://github.com/username/HugTranslate---AI-Powered-NLP-Multi-Language-Translation-App.git
   cd HugTranslate---AI-Powered-NLP-Multi-Language-Translation-App/frontend
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the Flutter app:**
   ```bash
   flutter run
   ```


## 📡 API Usage

**Translation Endpoint:**  
`POST /translate`

**Request Body:**
```json
{
  "text": "Hello world",
  "source_lang": "en",
  "target_lang": "de"
}
```

**Response:**
```json
{
  "translated_text": "Hallo Welt"
}
```

## 🤝 Contributing

1. Fork the repository  
2. Create a new branch:
   ```bash
   git checkout -b feature/your-feature
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your feature"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/your-feature
   ```
5. Open a Pull Request

## 📜 License

This project is licensed under the **MIT License**.


