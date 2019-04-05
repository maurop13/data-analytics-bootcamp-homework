import datetime as dt
import numpy as np
import pandas as pd

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

engine = create_engine("sqlite:///hawaii.sqlite")

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(engine, reflect=True)

# Save references to each table
Measurement = Base.classes.measurement
Station = Base.classes.station

# Create our session (link) from Python to the DB
session = Session(engine)


app = Flask(__name__)


@app.route("/")
def welcome():
	string="You're going to Hawaii? here's a nice API \n Available Routes: \n /api/precipitation \n /api/stations \n /api/tobs \n /api/tempwonlystart/<start> \n /api/tempwstartandend/<start>/<end>" 
	return string
    


@app.route("/api/precipitation")
def precipitation():
	# Calculate the date 1 year ago from today
	last_year = dt.date(2016, 8, 23)
	last_year_data = session.query(Measurement.date,Measurement.prcp).filter(Measurement.date>=last_year).all()
	result_json = {date: prcp for date, prcp in last_year_data}
	return jsonify(result_json)

@app.route("/api/stations")
def stations():
	stations = session.query(Station.station).all()
	stations_list = list(np.ravel(stations))
	return jsonify(stations_list)


@app.route("/api/tobs")
def temp_monthly():
	# Calculate the date 1 year ago from today
	last_year = dt.date(2016, 8, 23)
	last_year_data = session.query(Measurement.date,Measurement.tobs).filter(Measurement.date>=last_year).all()
	result_json = {date: tobs for date, tobs in last_year_data}
	return jsonify(result_json)

@app.route("/api/tempwonlystart/<start>")
def statsstart(start):
	no_end_date = session.query(func.min(Measurement.tobs), func.avg(Measurement.tobs), func.max(Measurement.tobs)).filter(Measurement.date >= start).all()
	# Unravel results into a 1D array and convert to a list
	temps = list(np.ravel(no_end_date))
	return jsonify(temps)

@app.route("/api/tempwstartandend/<start>/<end>")
def statsstartend(start, end):
	start_and_end = session.query(func.min(Measurement.tobs), func.avg(Measurement.tobs), func.max(Measurement.tobs)).filter(Measurement.date >= start).filter(Measurement.date<= end).all()
	# Unravel results into a 1D array and convert to a list
	temps = list(np.ravel(start_and_end))
	return jsonify(temps)	

if __name__ == '__main__':
    app.run()
