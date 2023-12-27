
import 'command.dart';
import 'counter.dart';

class CounterCommandHandler {

  final Counter counter = Counter(0);

  Counter executeCommand(CounterCommand command){

    if(command is IncrementCommand){
      counter.value ++;
    }else if(command is DecrementCommand){
      counter.value --;
    }

    return counter;
  }
}