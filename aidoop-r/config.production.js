try {
  var licenseKey = require("./license").Key;
} catch (e) {
  var licenseKey = {};
}

module.exports = {
  protocol: "http",
  subdomain: "system",
  accessTokenCookieKey: "access_token.robotics",
  SECRET: "0xD58F835B69D207A76CC5F84a70a1D0d4C79dAC95", // temporary...
  licenseKey,
  email: {
    host: "smtp.office365.com", // your sender-email smtp host
    port: 587, // smtp server port
    secure: false, // true for 465, false for other ports
    auth: {
      user: "your sender-email",
      pass: "your sender-email password", // generated ethereal password
    },
    secureConnection: false,
    tls: {
      ciphers: "SSLv3",
    },
  },
  logger: {
    file: {
      filename: "logs/application-%DATE%.log",
      datePattern: "YYYY-MM-DD-HH",
      zippedArchive: false,
      maxSize: "20m",
      maxFiles: "2d",
      level: "info",
    },
    console: {
      level: "silly",
    },
  },
  //   ormconfig: {
  //     name: 'default',
  //     type: 'sqlite',
  //     database: 'db.sqlite',
  //     synchronize: false,
  //     logging: true,
  //     logger: 'debug'
  //   },
  ormconfig: {
    name: "default",
    type: "postgres",
    host: "postgres",
    port: 5432,
    database: "postgres",
    username: "postgres",
    password: "abcd1234",
    synchronize: true,
    logging: true,
  },
  scheduler: {
    /* Name to be used for setting client's "application" properties when registering a schedule */
    application: "aidoop-r",
    /* Base endpoint to be used for setting "callback" properties when registering a schedule */
    callbackBase: "http://app:3000",
    /* 
        Scheduler service endpoint
        caution) endpoint for "localhost" has some problem. 
        https://github.com/node-fetch/node-fetch/issues/1624
      */
    endpoint: "http://scheduler:9902",
  },
  vision: {
    streamingPort: 3001,
    camera: {
      cameraCalibrator: {
        program: [
          "python3",
          "/app/object-tracker-python/object_tracker/objtracking_entry.py",
          "CAMERACALIB",
        ],
      },
      handEyeCalibrator: {
        program: [
          "python3",
          "/app/object-tracker-python/object_tracker/objtracking_entry.py",
          "HANDEYECALIB",
        ],
      },
      ROIDetector: {
        program: [
          "python3",
          "/app/object-tracker-python/object_tracker/roi_engine.py",
        ],
      },
    },
    robotArm: {
      markerOffsetCalibrator: {
        program: [
          "python3",
          "/app/object-tracker-python/object_tracker/objtracking_entry.py",
          "OBJTRACKING",
        ],
      },
    },
    objectTracker: {
      program: [
        "python3",
        "/app/object-tracker-python/object_tracker/objtracking_entry.py",
        "OBJTRACKING",
      ],
    },
  },
};
