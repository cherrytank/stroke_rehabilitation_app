import 'body_view/assembly.dart';
import 'detector_views.dart';

class global{
      static late int posenumber;
      static late Detector_default Det;
      static void pose_tranform(){
          switch(global.posenumber){
            //upper_body_right
            case 0:
              global.Det = Detector_shrug_right();
              break;
            case 1:
              global.Det = Detector_hold_hands_right();
              break;
            case 2:
              global.Det = Detector_wipe_table_right();
              break;
            case 3:
              global.Det = Detector_crutch_right();
              break;
            case 4:
              global.Det = Detector_elbow_movement_right();
              break;
            case 5:
              global.Det = Detector_bath_right();
              break;
            //upper_body_Advanced_right
            case 6:
              global.Det = Detector_forward_shoulder_right();
              break;
            case 7:
              global.Det = Detector_forward_elbow_right();
              break;
            case 8:
              global.Det = Detector_shoulder_raise_right();
              break;
            case 9:
              global.Det = Detector_heads_raise_right();
              break;
            case 10:
              global.Det = Detector_Shrugging_circles_right();
              break;
            case 11:
              global.Det = Detector_towel_right();
              break;
            //lower_body_right
            case 12:
              global.Det = Detector_thigh_stretch_right();
              break;
            case 13:
              global.Det = Detector_raise_feet_right();
              break;
            case 14:
              global.Det = Detector_thigh_abduction_right();
              break;
            case 15:
              global.Det = Detector_bent_knees_right();
              break;
            case 16:
              global.Det = Detector_thigh_receive_right();
              break;
            case 17:
              global.Det = Detector_calf_knees_right();
              break;
            //lower_body_Advanced_right
            case 18:
              global.Det = Detector_lift_feet_right();
              break;
            case 19:
              global.Det = Detector_stand_up_right();
              break;
            case 20:
              global.Det = Detector_standing_action_right();
              break;
            case 21:
              global.Det = Detector_standing_knee_bent_right();
              break;
            case 22:
              global.Det = Detector_Seated_Dynamics_right();
              break;
            case 23:
              global.Det = Detector_sitting_balance_right();
              break;
            //upper_body_left
           case 24:
              global.Det = Detector_shrug_left();
              break;
            case 25:
              global.Det = Detector_hold_hands_left();
              break;
            case 26:
              global.Det = Detector_wipe_table_left();
              break;
            case 27:
              global.Det = Detector_crutch_left();
              break;
            case 28:
              global.Det = Detector_elbow_movement_left();
              break;
            case 29:
              global.Det = Detector_bath_left();
              break;
          //upper_body_Advanced_left
            case 30:
              global.Det = Detector_forward_shoulder_left();
              break;
            case 31:
              global.Det = Detector_forward_elbow_left();
              break;
            case 32:
              global.Det = Detector_shoulder_raise_left();
              break;
            case 33:
              global.Det = Detector_heads_raise_left();
              break;
            case 34:
              global.Det = Detector_Shrugging_circles_left();
              break;
            case 35:
              global.Det = Detector_towel_left();
              break;
          //lower_body_left
            case 36:
              global.Det = Detector_thigh_stretch_left();
              break;
            case 37:
              global.Det = Detector_raise_feet_left();
              break;
            case 38:
              global.Det = Detector_thigh_abduction_left();
              break;
            case 39:
              global.Det = Detector_bent_knees_left();
              break;
            case 40:
              global.Det = Detector_thigh_receive_left();
              break;
            case 41:
              global.Det = Detector_calf_knees_left();
              break;
          //lower_body_Advanced_left
            case 42:
              global.Det = Detector_lift_feet_left();
              break;
            case 43:
              global.Det = Detector_stand_up_left();
              break;
            case 44:
              global.Det = Detector_standing_action_left();
              break;
            case 45:
              global.Det = Detector_standing_knee_bent_left();
              break;
            case 46:
              global.Det = Detector_Seated_Dynamics_left();
              break;
            case 47:
              global.Det = Detector_sitting_balance_left();
              break;
          }
      }
}




