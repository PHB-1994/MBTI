import 'package:flutter/material.dart';
import 'package:frontend/common/constants.dart';
import 'package:frontend/models/result_model.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/screens/history/result_detail_screen.dart';
import 'package:frontend/screens/home/home_screen.dart';
import 'package:frontend/screens/login/login_screen.dart';
import 'package:frontend/screens/map/map_screen.dart';
import 'package:frontend/screens/result/result_screen.dart';
import 'package:frontend/screens/signup/signup_screen.dart';
import 'package:frontend/screens/test/test_screen.dart';
import 'package:frontend/screens/types/mbti_types_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 1. 카카오 자바스크립트 키 초기화
  AuthRepository.initialize(appKey: 'ce0f5777990b9b7c1f0f744bf3e88e44');

  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    // 2. w지도 경로 스크린 추가 /map
    GoRoute(path: "/map", builder: (context, state) => const MapScreen()),

    // 로그인 화면
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    // 회원가입 화면
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    // 검사 화면
    GoRoute(
      path: '/test',
      builder: (context, state) {
        final userName = state.extra as String;

        return TestScreen(userName: userName);
      },
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) {
        final result = state.extra as Result;

        return ResultScreen(result: result);
        /*
            return ResultScreen(
                userName : data['userName']!,
                resultType : data['resultType']!,
              eScore: data['eScore']!,
              iScore: data['iScore']!,
              sScore: data['sScore']!,
              nScore: data['nScore']!,
              tScore: data['tScore']!,
              fScore: data['fScore']!,
              jScore: data['jScore']!,
              pScore: data['pScore']!,
            );
             */
      },
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) {
        final userName = state.extra as String;
        return ResultDetailScreen(userName: userName);
      },
    ),
    GoRoute(
      path: '/types',
      builder: (context, state) => const MbtiTypesScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //    google에서 제공하는 기본 커스텀 css 를 사용하며
    //                특정 경로를 개발자가 하나하나 설정하겠다.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: MaterialApp.router(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        // 경로설정에 대한 것은 : _router 라는 변수이름을 참고해서 사용하거라
        routerConfig: _router,
      ),
      /*추후 라이트테마 다크 테마를 만들어서 세팅
      * theme
      * darkTheme
      * themeMode
      * home 을 사용할 때는 go_router 와 같이
      * 기본 메인 위치를 지정하지 않고, home 을 기준으로
      * 경로 이동 없이 작성할 때 사용!
      * home: const HomeScreen(),
      * */
    );
  }
}
