import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

enum EditModel { textEditModel, codeEditModel }

extension EditModelExtension on EditModel {
  String getName() {
    switch (this) {
      case EditModel.codeEditModel:
        return kEditsCoedModel;
      case EditModel.textEditModel:
        return kEditsTextModel;
      default:
        return '';
    }
  }
}

class EditRequest {
  ///ID of the model to use. You can use the or model with this endpoint.[model]
  final EditModel model;

  ///The input text to use as a starting point for the edit.[input]
  final String input;

  ///The instruction that tells the model how to edit the prompt.[instruction]
  final String instruction;

  ///How many edits to generate for the input and instruction.[n]
  final int n;

  ///What sampling temperature to use, between 0 and 2. Higher
  ///values like 0.8 will make the output more random, while lower
  ///values like 0.2 will make it more focused and deterministic.
  ///We generally recommend altering this or but not both.top_p.[temperature]
  final int temperature;

  ///An alternative to sampling with temperature, called nucleus sampling,
  /// where the model considers the results of the tokens with top_p probability
  /// mass. So 0.1 means only the tokens comprising the top 10% probability
  /// mass are considered. We generally recommend altering this or but not
  /// both.temperature.[topP]
  final int topP;

  EditRequest(
      {required this.model,
      required this.input,
      required this.instruction,
      this.n = 1,
      this.temperature = 1,
      this.topP = 1});

  Map<String, dynamic> toJson() => Map.of({
        "model": model.getName(),
        "input": input,
        "instruction": instruction,
        "n": n,
        "temperature": temperature,
        "top_p": topP
      });
}
