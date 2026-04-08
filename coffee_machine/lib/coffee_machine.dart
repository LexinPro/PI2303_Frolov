import "./classes/Machine.dart";
import "./classes/MachineView.dart";
import "./classes/MachineController.dart";


Future<void> main() async {
    Machine machine = Machine();
    MachineView view = MachineView();
    MachineController controller = MachineController(machine, view);

    bool running = true;
    while (running) {
        running = await controller.runWork();
    }
}