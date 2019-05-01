import os

from flask import Flask


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'invernadero.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    #Para inicializar la DB
    from . import db
    db.init_app(app)

    #Para la autenticacion
    from . import auth
    app.register_blueprint(auth.bp)

    from . import grupo
    app.register_blueprint(grupo.bp)

    from . import site
    app.register_blueprint(site.bp)

    from . import sensor
    app.register_blueprint(sensor.bp)



    return app

