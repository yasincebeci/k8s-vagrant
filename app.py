import os
import flask
#import MySQLdb
import pymysql
pymysql.install_as_MySQLdb()

application = flask.Flask(__name__)
application.debug = True

@application.route('/')
def hello_world():
  storage = Storage()
  storage.populate()
  score = storage.score()
  return "Hello Devops 123, %d!" % score

class Storage():
  def __init__(self):
    self.db = MySQLdb.connect(
      user   = os.getenv('root'),
      passwd = os.getenv('root'),
      db     = os.getenv('new'),
      host   = os.getenv('db'),
      port   = int(os.getenv('3306'))
    )

    cur = self.db.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS scores(score INT)")

  def populate(self):
    cur = self.db.cursor()
    cur.execute("INSERT INTO scores(score) VALUES(1234)")

  def score(self):
    cur = self.db.cursor()
    cur.execute("SELECT * FROM scores")
    row = cur.fetchone()
    return row[0]

if __name__ == "__main__":
  application.run(host='0.0.0.0', port=3000)