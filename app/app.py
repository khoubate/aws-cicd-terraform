from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_docker():
    return '''
    <html>
        <head>
            <title>Welcome from Khalid</title>
            <style>
                body { font-family: Arial, sans-serif; padding: 40px; background-color: #f4f4f4; color: #333; }
                h1 { color: #2c3e50; }
                p { font-size: 1.2em; }
            </style>
        </head>
        <body>
            <h1>Hello, I'm Khalid 👋</h1>
            <p>
                Thanks for stopping by! I hope you found this content useful.
                If you're into DevOps, cloud infrastructure, and automation, be sure to follow for more updates.
            </p>
        </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
