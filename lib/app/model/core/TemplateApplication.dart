// TODO Implement this library.

import 'package:fluro/fluro.dart';
import 'package:template/app/model/core/AppRoutes.dart';
import 'package:template/config/Env.dart';
import 'package:template/utility/framework/Application.dart';
import 'package:template/utility/log/Log.dart';
import 'package:logging/logging.dart';

class TemplateApplication implements Application {
  Router router;
  //DatabaseHelper _db;
  //DBAppStoreRepository dbAppStoreRepository;
  //AppStoreAPIRepository appStoreAPIRepository;

  @override
  Future<void> onCreate() async {
    _initLog();
    _initRouter();
    //await _initDB();
    //_initDBRepository();
    //_initAPIRepository();
  }

  @override
  Future<void> onTerminate() async {
    //await _db.close();
  }

/*  Future<void> _initDB() async {
    AppDatabaseMigrationListener migrationListener = AppDatabaseMigrationListener();
    DatabaseConfig databaseConfig = DatabaseConfig(Env.value.dbVersion, Env.value.dbName, migrationListener);
    _db = DatabaseHelper(databaseConfig);
    Log.info('DB name : ' + Env.value.dbName);
//    await _db.deleteDB();
    await _db.open();
  }

  void _initDBRepository(){

    dbAppStoreRepository = DBAppStoreRepository(_db.database);
  }

  void _initAPIRepository(){
    APIProvider apiProvider = APIProvider();
    appStoreAPIRepository = AppStoreAPIRepository(apiProvider, dbAppStoreRepository);
  }
*/
  void _initLog(){
    Log.init();
    Log.setLevel(Level.ALL);
/*    switch(Env.value.environmentType){
      case EnvType.TESTING:
      case EnvType.DEVELOPMENT:
      case EnvType.STAGING:{
        Log.setLevel(Level.ALL);
        break;
      }
      case EnvType.PRODUCTION:{
        Log.setLevel(Level.INFO);
        break;
      }
    }

*/
  }

  void _initRouter(){
    router = new Router();
    AppRoutes.configureRoutes(router);
  }
}
