# https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask
import flask
from flask import render_template, request, jsonify
from python.rexplorer import os_list_files
import os


app = flask.Flask(__name__, static_url_path='', static_folder='web/static')
app.config["DEBUG"] = True

@app.route('/', methods=['GET'])
def home():
    return render_template('index.html')


@app.route('/dirR', methods=['GET'])
def list_files():
    if 'path' in request.args:
        # return jsonify({"Path": request.args['path']})
        return os_list_files(path=request.args['path'])
    else:
        return "Error: No path field provided. Please specify a path."


@app.route('/openPath', methods=['GET'])
def open_file():
    full_name = '"' + request.args['path'] + "\\" + request.args['fname'] + '"'
    print(full_name)
    os.system(full_name)
    return jsonify({"dir": request.args['path'], "open":"ok"})


# run app
app.run(port=8000)