from flask import Flask, request, jsonify
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM, pipeline



app = Flask(__name__)


# M2M100 Model ve Tokenizer
tokenizer = AutoTokenizer.from_pretrained("facebook/m2m100_418M")
model = AutoModelForSeq2SeqLM.from_pretrained("facebook/m2m100_418M")

@app.route('/translate', methods=['POST'])
def translate():
    data = request.get_json()
    input_text = data.get('text', '')
    source_lang = data.get('source_lang', 'en')  # Varsayılan kaynak dil
    target_lang = data.get('target_lang', 'fr')  # Varsayılan hedef dil

    if not input_text:
        return jsonify({'error': 'No text provided'}), 400

    try:
        # Modelde kaynak ve hedef dili ayarlama
        tokenizer.src_lang = source_lang
        encoded_text = tokenizer(input_text, return_tensors="pt")
        generated_tokens = model.generate(**encoded_text, forced_bos_token_id=tokenizer.get_lang_id(target_lang))
        translated_text = tokenizer.decode(generated_tokens[0], skip_special_tokens=True)

        return jsonify({'translated_text': translated_text}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001) 
