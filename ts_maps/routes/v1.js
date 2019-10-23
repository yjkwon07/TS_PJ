const express = require('express');
const cors = require('cors');
const util = require('util');
const url = require('url');
const googleMaps = require('@google/maps');

const ALLOW_URL = "localhost:8090";
const db = require('../db/connect');
const googleMapsClient = googleMaps.createClient({
    key: process.env.PLACES_API_KEY,
});
const router = express.Router();
let connection;

// router.use(async (req, res, next) => {
//     const domain = url.parse(req.get('origin')).host;
//     console.log(domain)
//     if (domain === ALLOW_URL) {
//         cors({ origin: req.get('origin') })(req, res, next);
//     } else {
//         next();
//     }
// });
router.use(cors());
router.get('/searchMap/autocomplete/:query', async (req, res, next) => {
    try {
        const placename = req.params.query;
        await googleMapsClient.placesQueryAutoComplete({
            input: placename,
            language: 'ko',
        }, (err, response) => {
            if (err) {
                res.stauts(419).json({
                    code: 419,
                    message: "검색어를 찾을 수 없습니다."
                })
            }
            res.status(200).json({
                code: 200,
                results: response.json.predictions
            });
        });
    } catch (err) {
        console.error(err);
        next(err);
    }
});

router.get('/searchMap/:query', async (req, res, next) => {
    try {
        const placename = req.params.query;
        const googlePlaces = util.promisify(googleMapsClient.places);
        await googlePlaces({
            query: placename,
            language: 'ko',
        }, (err, searchPlaces) => {
            if (err) {
                res.stauts(419).json({
                    code: 419,
                    message: "검색어를 찾을 수 없습니다."
                })
            }
            else {
                res.status(200).json({
                    code: 200,
                    results: searchPlaces.json.results
                });
            }
        });
    } catch (err) {
        console.error(err);
        next(err);
    }
});

router.get('/searchClass/autocomplete/:query', async (req, res, next) => {
    try {
        const classname = req.params.query;
        if(!connection) {
            connection =  await db.getConnection(async conn => conn)
        }
        let selectClass = `SELECT * FROM tbl_class WHERE class_name LIKE '%${classname}%' and class_endday >= curdate()`;
        await connection.query(selectClass, (err, classSearch) => {
            if (err) {
                res.status(419).json({
                    code: 419,
                    message: "검색어를 찾을 수 없습니다."
                })
            }
            else {
                res.json({
                    code: 200,
                    results: classSearch
                });
            }
        });
    } catch (err) {
        console.error(err);
        next(err);
    }
});

router.get('/searchClass/:query', async (req, res, next) => {
    try {
        if(!connection) {
            connection =  await db.getConnection(async conn => conn)
        }
        const classname = req.params.query;
        let selectClass = `SELECT * FROM ts_pj.tbl_class WHERE class_name = '${classname}' and class_endday >= curdate()`;
        await connection.query(selectClass, (err, classSearch) => {
            if (err) {
                res.status(419).json({
                    code: 419,
                    message: '검색한 결과가 없습니다.'
                });
            } else {
                res.json({
                    code: 200,
                    results: classSearch
                });
            }
        });
    } catch (err) {
        console.error(err);
        next(err);
    }
});

router.get('/searchBoundsLecture', async (req, res, next) => {
    try {
        if(!connection) {
            connection =  await db.getConnection(async conn => conn)
        }
        const startLat = req.query.startLat;
        const startLng = req.query.startLng;
        const endLat = req.query.endLat;
        const endLng = req.query.endLng;

        let selectClass = `SELECT * FROM ts_pj.tbl_class
        WHERE ${startLat} <= class_lat and ${startLng} <= class_lng
        and ${endLat} >= class_lat and ${endLng} >= class_lng`;
        
        await connection.query(selectClass, (err, classSearch) => {
            if (err) {
                res.status(419).json({
                    code: 419,
                    message: '검색한 결과가 없습니다.'
                });
            } else {
                res.json({
                    code: 200,
                    results: classSearch
                });
            }
        });
    } catch (err) {
        console.error(err);
        next(err);
    }
});

module.exports = router;