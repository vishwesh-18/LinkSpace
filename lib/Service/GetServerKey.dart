import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {
  Future<String> getServerKey() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.messaging',
      'https://www.googleapis.com/auth/firebase.database',
    ];
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
            {
              "type": "service_account",
              "project_id": "linkspace-84e7f",
              "private_key_id": "9ef8f88803bac133ea8ae878f36f975474ff1526",
              "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDnqDsfCR2OJ5vW\nLfwOdRKSCUrYG6kx2513W9oOdnqK9sDvR2hVDyEvtHm4CV7cSPSrWzhACla9wfeu\nteSY3NnRLLsFj5oC1hSoY/kiNoqPAY+BGDV6SN8Nhb0ObSFVImMtBOyTuhka8chH\nRRw9kUuDPiPLjfDwR4SmjbFR6rny6Tt/o19+DHpfKIKO+rtXq2fe5L4Ok5Mk3ntv\nig5uyJCEsUwXwmOQ6HNZq6O+rJN30td213YQAmh9DX0fkLHMZ9KUxTH9DYF2q9L4\nK1tRPk4mWltakBM5FnnjgtkBlR5Tp9FWGKyvHu0wbq3AdziyaHf1+iS61OkKnjmT\n2JLh4xYZAgMBAAECggEAOQWSPe60uXXa+GK70UQ0hMFoTJ8sa9Ma5NM1bstvmQ6p\niYyKbCuL9+3k6y3VTYRgw2AyDaNt3AongTgRM6ZjMEeiJnmFR67yCUwIekkyHIbe\nD8EJgtb2nqG9mlQ2+Pl8r4tvf2J2xQjgS1jB3Y7K51yPm46OENsN1iB5Fgig6l9S\nO/lCWtSkvnCd1+yFCYABBM7AtjW7t1mmmdOFENNZf1swHbh1+Z4XJbYzUcvwBEUE\nmGaeAeZ+8MCSzhJZ6arwOBgSIv8ItoH60MInW5v+iUZZ0ONeQ9rVNq3jKQqBhBQd\n8DXLmjzdeHOUUE0eCyaafaqwdDcufUy9CP2fyIZfPQKBgQD7pI3oLfIRma5fQAyk\nRQbfIpY5VOlwzAS7+knfMzBnKxd9cYfmxyH8cbw+bV0dPH+LsfPL4A7lZD74fPiS\nzvY7b3batf1xxZoHqWqZoBmq+XadjDDf7LclduhzonfCK70SyUkKzcIzJOVECdfl\n/+tCVD40GMH/6ML+TTZdvoyoJQKBgQDrqxZRWyPq8zsHb+qmrI3/14GjIKQ6XS1V\nGB6ibkEsMwH0PsZtkXlLsWgV4TmpDMrAINUzjEZiXc9vA8ye+c/fMyvUVK4MjIPy\n8gdqulRv/hSzaXKud/Gr8YDOJmAP07xr58Qwh3eK53gOPZF5vUw4/OF3DUDOM8oA\nBSqJXrvp5QKBgQCMKSidVNIKuZWlGhCwgn4EVMhloITxvcE5TnxM5L8mB5tq1IyE\nnw+wA019W/7MJQFJttF7Eg5Z+I8Was0tQDdn/Xqu8UT8VLqpX9SvQrxpPc+yiv5C\nCyArruJkXe7kaOZEC3cynE55nChS0ES/p97KsA+BhvSvbF8Hs8v/RP4lPQKBgCZ+\npsGZQo+xNVYsqMaa7wL4X7uWrFzANZRtwStFGS4wEsSjsGPbXFXJ37ebN4Dujvu9\nITYvVpvguO5oT3c0VQkfYaxoPJneJft8H0wGrZ4xgY4gzlPDUd2FMEX8LLrJGkEB\n9aD7r8IntwuUcPvSuO2iGO4KYyiLexZvwZf4unclAoGAV0UI2S196/uhVDJGHvKm\nsFjcP64LsCs0W7cwnkWnf2jnPlcMtbU1bR+Pp9qG910IOBT2FtG9K69HY8yrngZw\nQzTau6lXLOdB0fR77ZLXh5B+0bJ1iXWe40GvJ6yEHzec2jmyJbjNCemHqp97Opge\n4lOGDz72oLXZFWbt7stZvjE=\n-----END PRIVATE KEY-----\n",
              "client_email": "firebase-adminsdk-5e9m7@linkspace-84e7f.iam.gserviceaccount.com",
              "client_id": "116416647860852789690",
              "auth_uri": "https://accounts.google.com/o/oauth2/auth",
              "token_uri": "https://oauth2.googleapis.com/token",
              "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
              "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-5e9m7%40linkspace-84e7f.iam.gserviceaccount.com",
              "universe_domain": "googleapis.com"
            }


        ),
        scopes,
    );
    final accessServerkey = client.credentials.accessToken.data;

    return accessServerkey;
  }
}
