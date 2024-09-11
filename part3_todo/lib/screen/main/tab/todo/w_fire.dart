import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Fire extends StatelessWidget {
  const Fire({super.key});

  @override
  Widget build(BuildContext context) {
    late StateMachineController controller;
    late SMIBool smiOn;
    late SMIBool smiHover;

    return RiveAnimation.asset(
      '$baseRivPath/fire_button.riv',
          stateMachines: const ['State Machine 1'],
      onInit: (Artboard art) {
        controller = StateMachineController.fromArtboard(art, 'State Machine 1')!;
        controller.isActive = true;
        art.addController(controller);
        smiOn = controller.findInput<bool>('ON') as SMIBool;
        smiHover = controller.findInput<bool>('Hover') as SMIBool;
        smiOn.value = true;
      },
    );
  }
}
