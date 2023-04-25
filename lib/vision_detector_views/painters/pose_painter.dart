import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'coordinates_translator.dart';
import '../camera_view.dart';
List<double?> posedata=[];
List<double?> posetrust=[];
class PosePainter extends CustomPainter {
  PosePainter(this.poses, this.absoluteImageSize, this.rotation);
  final List<Pose> poses;
  final Size absoluteImageSize;
  final InputImageRotation rotation;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..color = Colors.green;

    final leftPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.yellow;

    final rightPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.blueAccent;

    final headPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.white30;

    for (final pose in poses) {
      pose.landmarks.forEach((_, landmark) {
        canvas.drawCircle(
            Offset(
              translateX(landmark.x, rotation, size, absoluteImageSize),
              translateY(landmark.y, rotation, size, absoluteImageSize),
            ),
            1,
            paint);
      });

      void paintLine(
          PoseLandmarkType type1, PoseLandmarkType type2, Paint paintType) {
        final PoseLandmark joint1 = pose.landmarks[type1]!;
        final PoseLandmark joint2 = pose.landmarks[type2]!;
        canvas.drawLine(
            Offset(translateX(joint1.x, rotation, size, absoluteImageSize),
                translateY(joint1.y, rotation, size, absoluteImageSize)),
            Offset(translateX(joint2.x, rotation, size, absoluteImageSize),
                translateY(joint2.y, rotation, size, absoluteImageSize)),
            paintType);
      }

      //Draw arms
      paintLine(
          PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow, leftPaint);
      paintLine(
          PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist, leftPaint);
      paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow,
          rightPaint);
      paintLine(
          PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist, rightPaint);

      //Draw Body
      paintLine(
          PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip, leftPaint);
      paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip,
          rightPaint);
      paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.leftShoulder, headPaint);
      paintLine(PoseLandmarkType.rightHip, PoseLandmarkType.leftHip, headPaint);
      //Draw legs
      paintLine(PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee, leftPaint);
      paintLine(
          PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle, leftPaint);
      paintLine(
          PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee, rightPaint);
      paintLine(
          PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle, rightPaint);
      //Draw face
      paintLine(PoseLandmarkType.leftEar, PoseLandmarkType.leftEyeOuter, headPaint);
      paintLine(PoseLandmarkType.leftEyeOuter, PoseLandmarkType.leftEye, headPaint);
      paintLine(PoseLandmarkType.leftEyeInner, PoseLandmarkType.nose, headPaint);
      paintLine(PoseLandmarkType.nose, PoseLandmarkType.rightEyeInner, headPaint);
      paintLine(PoseLandmarkType.rightEyeInner, PoseLandmarkType.rightEyeOuter, headPaint);
      paintLine(PoseLandmarkType.rightEyeOuter, PoseLandmarkType.rightEar, headPaint);
      paintLine(PoseLandmarkType.rightMouth, PoseLandmarkType.leftMouth, headPaint);

      //return data
      //print(pose.landmarks[PoseLandmarkType.leftShoulder]?.x);
      if(cameramode_front)
        posedata=[
          pose.landmarks[PoseLandmarkType.nose]?.x,pose.landmarks[PoseLandmarkType.nose]?.y,//0,1
          pose.landmarks[PoseLandmarkType.rightEyeInner]?.x,pose.landmarks[PoseLandmarkType.rightEyeInner]?.y,//8,9
          pose.landmarks[PoseLandmarkType.rightEye]?.x,pose.landmarks[PoseLandmarkType.rightEye]?.y,//10,11
          pose.landmarks[PoseLandmarkType.rightEyeOuter]?.x,pose.landmarks[PoseLandmarkType.rightEyeOuter]?.y,//12,13
          pose.landmarks[PoseLandmarkType.leftEyeInner]?.x,pose.landmarks[PoseLandmarkType.leftEyeInner]?.y,//2,3
          pose.landmarks[PoseLandmarkType.leftEye]?.x,pose.landmarks[PoseLandmarkType.leftEye]?.y,//4,5
          pose.landmarks[PoseLandmarkType.leftEyeOuter]?.x,pose.landmarks[PoseLandmarkType.leftEyeOuter]?.y,//6,7
          pose.landmarks[PoseLandmarkType.rightEar]?.x,pose.landmarks[PoseLandmarkType.rightEar]?.y,//16,17
          pose.landmarks[PoseLandmarkType.leftEar]?.x,pose.landmarks[PoseLandmarkType.leftEar]?.y,//14,15
          pose.landmarks[PoseLandmarkType.rightMouth]?.x,pose.landmarks[PoseLandmarkType.rightMouth]?.y,//20,21
          pose.landmarks[PoseLandmarkType.leftMouth]?.x,pose.landmarks[PoseLandmarkType.leftMouth]?.y,//18,19
          pose.landmarks[PoseLandmarkType.rightShoulder]?.x,pose.landmarks[PoseLandmarkType.rightShoulder]?.y,//24,25
          pose.landmarks[PoseLandmarkType.leftShoulder]?.x,pose.landmarks[PoseLandmarkType.leftShoulder]?.y,//22,23
          pose.landmarks[PoseLandmarkType.rightElbow]?.x,pose.landmarks[PoseLandmarkType.rightElbow]?.y,//28,29
          pose.landmarks[PoseLandmarkType.leftElbow]?.x,pose.landmarks[PoseLandmarkType.leftElbow]?.y,//26,27
          pose.landmarks[PoseLandmarkType.rightWrist]?.x,pose.landmarks[PoseLandmarkType.rightWrist]?.y,//32,33
          pose.landmarks[PoseLandmarkType.leftWrist]?.x,pose.landmarks[PoseLandmarkType.leftWrist]?.y,//30,31
          pose.landmarks[PoseLandmarkType.rightPinky]?.x,pose.landmarks[PoseLandmarkType.rightPinky]?.y,//36,37
          pose.landmarks[PoseLandmarkType.leftPinky]?.x,pose.landmarks[PoseLandmarkType.leftPinky]?.y,//34,35
          pose.landmarks[PoseLandmarkType.rightIndex]?.x,pose.landmarks[PoseLandmarkType.rightIndex]?.y,//40,41
          pose.landmarks[PoseLandmarkType.leftIndex]?.x,pose.landmarks[PoseLandmarkType.leftIndex]?.y,//38,39
          pose.landmarks[PoseLandmarkType.rightThumb]?.x,pose.landmarks[PoseLandmarkType.rightThumb]?.y,//44,45
          pose.landmarks[PoseLandmarkType.leftThumb]?.x,pose.landmarks[PoseLandmarkType.leftThumb]?.y,//42,43
          pose.landmarks[PoseLandmarkType.rightHip]?.x,pose.landmarks[PoseLandmarkType.rightHip]?.y,//48,49
          pose.landmarks[PoseLandmarkType.leftHip]?.x,pose.landmarks[PoseLandmarkType.leftHip]?.y,//46,47
          pose.landmarks[PoseLandmarkType.rightKnee]?.x,pose.landmarks[PoseLandmarkType.rightKnee]?.y,//52,53
          pose.landmarks[PoseLandmarkType.leftKnee]?.x,pose.landmarks[PoseLandmarkType.leftKnee]?.y,//50,51
          pose.landmarks[PoseLandmarkType.rightAnkle]?.x,pose.landmarks[PoseLandmarkType.rightAnkle]?.y,//56,57
          pose.landmarks[PoseLandmarkType.leftAnkle]?.x,pose.landmarks[PoseLandmarkType.leftAnkle]?.y,//54,55
          pose.landmarks[PoseLandmarkType.rightHeel]?.x,pose.landmarks[PoseLandmarkType.rightHeel]?.y,//60,61
          pose.landmarks[PoseLandmarkType.leftHeel]?.x,pose.landmarks[PoseLandmarkType.leftHeel]?.y,//58,59
          pose.landmarks[PoseLandmarkType.rightFootIndex]?.x,pose.landmarks[PoseLandmarkType.rightFootIndex]?.y,//64,65
          pose.landmarks[PoseLandmarkType.leftFootIndex]?.x,pose.landmarks[PoseLandmarkType.leftFootIndex]?.y,//62,63
        ];
      else
        posedata=[
        pose.landmarks[PoseLandmarkType.nose]?.x,pose.landmarks[PoseLandmarkType.nose]?.y,//0,1
        pose.landmarks[PoseLandmarkType.leftEyeInner]?.x,pose.landmarks[PoseLandmarkType.leftEyeInner]?.y,//2,3
        pose.landmarks[PoseLandmarkType.leftEye]?.x,pose.landmarks[PoseLandmarkType.leftEye]?.y,//4,5
        pose.landmarks[PoseLandmarkType.leftEyeOuter]?.x,pose.landmarks[PoseLandmarkType.leftEyeOuter]?.y,//6,7
        pose.landmarks[PoseLandmarkType.rightEyeInner]?.x,pose.landmarks[PoseLandmarkType.rightEyeInner]?.y,//8,9
        pose.landmarks[PoseLandmarkType.rightEye]?.x,pose.landmarks[PoseLandmarkType.rightEye]?.y,//10,11
        pose.landmarks[PoseLandmarkType.rightEyeOuter]?.x,pose.landmarks[PoseLandmarkType.rightEyeOuter]?.y,//12,13
        pose.landmarks[PoseLandmarkType.leftEar]?.x,pose.landmarks[PoseLandmarkType.leftEar]?.y,//14,15
        pose.landmarks[PoseLandmarkType.rightEar]?.x,pose.landmarks[PoseLandmarkType.rightEar]?.y,//16,17
        pose.landmarks[PoseLandmarkType.leftMouth]?.x,pose.landmarks[PoseLandmarkType.leftMouth]?.y,//18,19
        pose.landmarks[PoseLandmarkType.rightMouth]?.x,pose.landmarks[PoseLandmarkType.rightMouth]?.y,//20,21
        pose.landmarks[PoseLandmarkType.leftShoulder]?.x,pose.landmarks[PoseLandmarkType.leftShoulder]?.y,//22,23
        pose.landmarks[PoseLandmarkType.rightShoulder]?.x,pose.landmarks[PoseLandmarkType.rightShoulder]?.y,//24,25
        pose.landmarks[PoseLandmarkType.leftElbow]?.x,pose.landmarks[PoseLandmarkType.leftElbow]?.y,//26,27
        pose.landmarks[PoseLandmarkType.rightElbow]?.x,pose.landmarks[PoseLandmarkType.rightElbow]?.y,//28,29
        pose.landmarks[PoseLandmarkType.leftWrist]?.x,pose.landmarks[PoseLandmarkType.leftWrist]?.y,//30,31
        pose.landmarks[PoseLandmarkType.rightWrist]?.x,pose.landmarks[PoseLandmarkType.rightWrist]?.y,//32,33
        pose.landmarks[PoseLandmarkType.leftPinky]?.x,pose.landmarks[PoseLandmarkType.leftPinky]?.y,//34,35
        pose.landmarks[PoseLandmarkType.rightPinky]?.x,pose.landmarks[PoseLandmarkType.rightPinky]?.y,//36,37
        pose.landmarks[PoseLandmarkType.leftIndex]?.x,pose.landmarks[PoseLandmarkType.leftIndex]?.y,//38,39
        pose.landmarks[PoseLandmarkType.rightIndex]?.x,pose.landmarks[PoseLandmarkType.rightIndex]?.y,//40,41
        pose.landmarks[PoseLandmarkType.leftThumb]?.x,pose.landmarks[PoseLandmarkType.leftThumb]?.y,//42,43
        pose.landmarks[PoseLandmarkType.rightThumb]?.x,pose.landmarks[PoseLandmarkType.rightThumb]?.y,//44,45
        pose.landmarks[PoseLandmarkType.leftHip]?.x,pose.landmarks[PoseLandmarkType.leftHip]?.y,//46,47
        pose.landmarks[PoseLandmarkType.rightHip]?.x,pose.landmarks[PoseLandmarkType.rightHip]?.y,//48,49
        pose.landmarks[PoseLandmarkType.leftKnee]?.x,pose.landmarks[PoseLandmarkType.leftKnee]?.y,//50,51
        pose.landmarks[PoseLandmarkType.rightKnee]?.x,pose.landmarks[PoseLandmarkType.rightKnee]?.y,//52,53
        pose.landmarks[PoseLandmarkType.leftAnkle]?.x,pose.landmarks[PoseLandmarkType.leftAnkle]?.y,//54,55
        pose.landmarks[PoseLandmarkType.rightAnkle]?.x,pose.landmarks[PoseLandmarkType.rightAnkle]?.y,//56,57
        pose.landmarks[PoseLandmarkType.leftHeel]?.x,pose.landmarks[PoseLandmarkType.leftHeel]?.y,//58,59
        pose.landmarks[PoseLandmarkType.rightHeel]?.x,pose.landmarks[PoseLandmarkType.rightHeel]?.y,//60,61
        pose.landmarks[PoseLandmarkType.leftFootIndex]?.x,pose.landmarks[PoseLandmarkType.leftFootIndex]?.y,//62,63
        pose.landmarks[PoseLandmarkType.rightFootIndex]?.x,pose.landmarks[PoseLandmarkType.rightFootIndex]?.y,//64,65
      ];
      posetrust=[
        pose.landmarks[PoseLandmarkType.nose]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftEyeInner]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftEye]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftEyeOuter]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightEyeInner]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightEye]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightEyeOuter]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftEar]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightEar]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftMouth]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightMouth]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftShoulder]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightShoulder]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftElbow]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightElbow]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftWrist]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightWrist]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftPinky]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightPinky]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftIndex]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightIndex]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftThumb]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightThumb]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftHip]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightHip]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftKnee]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightKnee]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftAnkle]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightAnkle]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftHeel]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightHeel]?.likelihood,
        pose.landmarks[PoseLandmarkType.leftFootIndex]?.likelihood,
        pose.landmarks[PoseLandmarkType.rightFootIndex]?.likelihood,
      ];
    }
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.poses != poses;
  }
}
