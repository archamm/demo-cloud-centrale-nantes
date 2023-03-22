# Importer les bibliothèques nécessaires
from flask import Flask
import os

# Créer l'application Flask
app = Flask(__name__)

# Définir la route d'accueil
@app.route('/')
def home():
    # Retourner un message de bienvenue
    return "Bienvenue sur notre application PaaS!"

# Exécuter l'application
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))
