import 'package:flutter/widgets.dart';

class Exercise with ChangeNotifier{
  final String id;
  final String category;
  final String title;
  final String imageUrl;
  final String equipments;
  final String reps;

  Exercise({
    required this.id,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.equipments,
    required this.reps,
  });
}

class Exercises with ChangeNotifier{
  final List<Exercise>_list =  [
    Exercise(
        id:'e1',
        category:'c2',
        title:'DOUBLE ARM DUMBBELL CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2022/04/Double-Arm-Dumbbell-Curl.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e2',
        category:'c2',
        title:'DUMBBELL CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Curl.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e3',
        category:'c2',
        title:'BARBELL CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Curl.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e4',
        category:'c2',
        title:'CONCENTRATION CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Concentration-Curl.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e5',
        category:'c2',
        title:'DUMBBELL PREACHER CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Preacher-Curl.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e6',
        category:'c2',
        title:'Z-BAR PREACHER CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Z-Bar-Preacher-Curl.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e7',
        category:'c2',
        title:'Z-BAR PREACHER CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Hammer-Curl.gif',
        equipments:' Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e8',
        category:'c2',
        title:'SEATED İNCLINE DUMBBELL CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Seated-Incline-Dumbbell-Curl.gif',
        equipments:' Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e9',
        category:'c1',
        title:'ARM SCISSORS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2022/02/Arm-Scissors.gif',
        equipments:'Full Gym, NO EQUIPMENT',
        reps:'90secs'
    ),
    Exercise(
        id:'e10',
        category:'c1',
        title:'BENCH PRESS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Bench-Press.gif',
        equipments:'Barbell, Bench, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e11',
        category:'c1',
        title:'PEC DECK FLY',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Pec-Deck-Fly.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e12',
        category:'c1',
        title:'DUMBBELL PULLOVER',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Pullover.gif',
        equipments:'Bench, Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e13',
        category:'c1',
        title:'İNCLINE BARBELL BENCH PRESS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Incline-Barbell-Bench-Press.gif',
        equipments:'Barbell, Bench, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e14',
        category:'c1',
        title:'DUMBBELL FLY',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Fly.gif',
        equipments:'Bench, Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e15',
        category:'c1',
        title:'DUMBBELL BENCH PRESS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Press-1.gif',
        equipments:'Bench, Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e16',
        category:'c1',
        title:'CHEST DIPS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Chest-Dips.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e17',
        category:'c1',
        title:'DUMBBELL UPWARD FLY',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/10/Dumbbell-Upward-Fly.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e18',
        category:'c3',
        title:'DUMBBELL KICKBACK',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Kickback.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e19',
        category:'c3',
        title:'PUSH-DOWN',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Pushdown.gif',
        equipments:'Cable, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e20',
        category:'c3',
        title:'BENCH DIPS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Bench-Dips.gif',
        equipments:'Bench, Full Gym, NO EQUIPMENT',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e21',
        category:'c3',
        title:'TRICEPS DIPS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Triceps-Dips.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e22',
        category:'c3',
        title:'ONE ARM LYING TRICEPS EXTENSION',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/04/One-Arm-Lying-Triceps-Extension.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e23',
        category:'c3',
        title:'LYING BARBELL TRICEPS EXTENSION',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Triceps-Extension.gif',
        equipments:'Barbell, Bench, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e24',
        category:'c3',
        title:'CABLE TRICEP KICKBACK',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Cable-Tricep-Kickback.gif',
        equipments:'Cable, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e25',
        category:'c3',
        title:'SEATED DUMBBELL TRICEPS EXTENSION',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Seated-Dumbbell-Triceps-Extension.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e26',
        category:'c3',
        title:'HIGH PULLEY OVERHEAD TRICEP EXTENSION',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/High-Pulley-Overhead-Tricep-Extension.gif',
        equipments:'Cable, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e27',
        category:'c3',
        title:'ROPE PUSHDOWN',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Rope-Pushdown.gif',
        equipments:'Cable, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e28',
        category:'c4',
        title:'DUMBBELL LATERAL RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Lateral-Raise.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e29',
        category:'c4',
        title:'DUMBBELL SHOULDER PRESS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Shoulder-Press.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e30',
        category:'c4',
        title:'BARBELL SHOULDER PRESS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Shoulder-Press.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e31',
        category:'c4',
        title:'STANDING CLOSE GRIP MILITARY PRESS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/10/Standing-Barbell-Close-Grip-Military-Press.gif',
        equipments:'Barbell',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e32',
        category:'c4',
        title:'BARBELL MILITARY PRESS (OVERHEAD PRESS)',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/04/Barbell-Military-Press.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e33',
        category:'c4',
        title:'ALTERNATING DUMBBELL FRONT RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Alternating-Dumbbell-Front-Raise.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e34',
        category:'c4',
        title:'SEATED REAR LATERAL DUMBBELL RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Seated-Rear-Lateral-Dumbbell-Raise.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e35',
        category:'c4',
        title:'FACE PULL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Face-Pull.gif',
        equipments:'Cable, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e36',
        category:'c4',
        title:'EZ BAR UPRIGHT ROW',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Upright-Row.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e37',
        category:'c5',
        title:'STANDING CABLE CRUNCH',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/09/Standing-Cable-Crunch.gif',
        equipments:'Cable, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e38',
        category:'c5',
        title:'CRUNCHES',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2015/11/Crunch.gif',
        equipments:'Full Gym, NO EQUIPMENT',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e39',
        category:'c5',
        title:'MOUNTAIN CLIMBER',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Mountain-climber.gif',
        equipments:'Full Gym, NO EQUIPMENT',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e40',
        category:'c5',
        title:'DECLINE SIT-UP',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/05/Decline-Sit-up.gif',
        equipments:'Bench, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e41',
        category:'c5',
        title:'KNEELING CABLE CRUNCH',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Kneeling-Cable-Crunch.gif',
        equipments:'Machine, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e42',
        category:'c5',
        title:'CAPTAINS CHAIR LEG RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/05/Captains-Chair-Leg-Raise.gif',
        equipments:'Cable, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e43',
        category:'c5',
        title:'WEIGHTED SIT-UPS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/05/weightedsitups.gif',
        equipments:'Full Gym, NO EQUIPMENT',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e44',
        category:'c6',
        title:'PULL-UP',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Pull-up.gif',
        equipments:'Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e45',
        category:'c6',
        title:'CABLE REAR PULLDOWN',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/08/Cable-Rear-Pulldown.gif',
        equipments:'Cable',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e46',
        category:'c6',
        title:'LAT PULLDOWN',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Lat-Pulldown.gif',
        equipments:'Cable,Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e47',
        category:'c6',
        title:'SEATED CABLE ROW',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Seated-Cable-Row.gif',
        equipments:'Cable,Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e48',
        category:'c6',
        title:'BARBELL BENT OVER ROW',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Bent-Over-Row.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e49',
        category:'c6',
        title:'CABLE STRAIGHT ARM PULLDOWN',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/05/Cable-Straight-Arm-Pulldown.gif',
        equipments:'Cable, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e50',
        category:'c6',
        title:'LEVER T-BAR ROW',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Lever-T-bar-Row.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e51',
        category:'c6',
        title:'DUMBBELL ROW',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Row.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e52',
        category:'c6',
        title:'ROMANIAN DEADLIFT',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Romanian-Deadlift.gif',
        equipments:' Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e53',
        category:'c7',
        title:'WRIST ROLLER',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/08/wrist-roller.gif',
        equipments:'Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e54',
        category:'c7',
        title:'DUMBBELL WRIST CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Dumbbell-Wrist-Curl.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e55',
        category:'c7',
        title:'BARBELL REVERSE WRIST CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Barbell-Reverse-Wrist-Curl.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e56',
        category:'c7',
        title:'BARBELL REVERSE CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Reverse-Curl.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e58',
        category:'c7',
        title:'WEIGHTED NEUTRAL WRIST CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Weighted-Wrist-Curl.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e57',
        category:'c7',
        title:'SEATED HAMMER CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/04/Seated-Hammer-Curl.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e59',
        category:'c7',
        title:'REVERSE WRIST CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Reverse-Wrist-Curl.gif',
        equipments:'Barbell,Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e60',
        category:'c8',
        title:'SQUAT',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/BARBELL-SQUAT.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e61',
        category:'c8',
        title:'LEG PRESS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2015/11/Leg-Press.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e62',
        category:'c8',
        title:'DEADLIFT',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Barbell-Deadlift.gif',
        equipments:' Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e63',
        category:'c8',
        title:'LEG CURL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Leg-Curl.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e64',
        category:'c8',
        title:'LEG EXTENSION',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/LEG-EXTENSION.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e65',
        category:'c8',
        title:'DUMBBELL BULGARIAN SPLIT SQUAT',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/05/Dumbbell-Bulgarian-Split-Squat.gif',
        equipments:'Bench, Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e66',
        category:'c8',
        title:'HACK SQUATS MACHINE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Sled-Hack-Squat.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e67',
        category:'c8',
        title:'DUMBBELL LUNGE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Lunge.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e68',
        category:'c8',
        title:'DUMBBELL STRAIGHT LEG DEADLIFT',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/04/Dumbbell-Straight-Leg-Deadlift.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e69',
        category:'c9',
        title:'CALF RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/02/Dumbbell-Calf-Raise.gif',
        equipments:'Dumbbells, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e70',
        category:'c9',
        title:'LEG PRESS CALF RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/05/Leg-Press-Calf-Raise.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e71',
        category:'c9',
        title:'LEVER SEATED CALF RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Lever-Seated-Calf-Raise.gif',
        equipments:'Full Gym, Machine',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e72',
        category:'c9',
        title:'STANDING BARBELL CALF RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2022/04/Standing-Barbell-Calf-Raise.gif',
        equipments:'Barbell, Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e73',
        category:'c9',
        title:'WEIGHTED DONKEY CALF RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2022/04/Weighted-Donkey-Calf-Raise.gif',
        equipments:'Full Gym',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e74',
        category:'c9',
        title:'SQUAT HOLD CALF RAISE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/12/Squat-Hold-Calf-Raise.gif',
        equipments:'Full Gym, NO EQUIPMENT',
        reps:'12-10-8-6'
    ),
    Exercise(
        id:'e75',
        category:'c10',
        title:'RIDING OUTDOOR BICYCLE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2022/02/Riding-Outdoor-Bicycle.gif',
        equipments:'Full Gym',
        reps:'30min'
    ),
    Exercise(
        id:'e76',
        category:'c10',
        title:'RUNNING',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/07/Run.gif',
        equipments:'Full Gym, NO EQUIPMENT',
        reps:'15min'
    ),
    Exercise(
        id:'e77',
        category:'c10',
        title:'WALK WAVE MACHINE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/10/Walk-Wave-Machine.gif',
        equipments:' Full Gym, Machine',
        reps:'15min'
    ),
    Exercise(
        id:'e78',
        category:'c10',
        title:'JUMP ROPE',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Jump-Rope.gif',
        equipments:' Full Gym, Machine',
        reps:'10min'
    ),
    Exercise(
        id:'e79',
        category:'c10',
        title:'TREADMILL',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/06/Treadmill-.gif',
        equipments:' Full Gym, Machine',
        reps:'10min'
    ),
    Exercise(
        id:'e80',
        category:'c10',
        title:'BOXING RIGHT CROSS',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2022/02/Boxing-Right-Cross-with-boxing-bag.gif',
        equipments:' Full Gym',
        reps:'10min'
    ),
    Exercise(
        id:'e81',
        category:'c10',
        title:'FAST FEET RUN',
        imageUrl:'https://fitnessprogramer.com/wp-content/uploads/2021/09/Fast-Feet-Run.gif',
        equipments:'Full Gym, NO EQUIPMENT',
        reps:'10min'
    ),



  ];

  List<Exercise> get list{
    return[..._list
    ];
  }

  bool _disposed =false ;


  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

}