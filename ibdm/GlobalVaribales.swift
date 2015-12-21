//
//  GlobalVaribales.swift
//  ibdm
//
//  Created by Chen Wang on 12/20/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import Foundation

var serverUrlBase: String = "http://ec2-52-91-4-187.compute-1.amazonaws.com/get"
var apiUrlBase: String = "http://image.tmdb.org/t/p/w500"

typealias DownloadComplete = () -> ()

 var parametersMovie = ["FromYear":"1,1990", "ToYear":"2,2016", "Genre":"Comdy", "Popularity":"0.01", "RunTime":"180", "OrderbyPopularity":"True", "OrderbyRunTime":"True"]