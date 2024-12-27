import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pinput extends StatefulWidget {
  const Pinput(
      {super.key,
      this.length = 4,
      this.width = 95,
      this.height = 20,
      this.borderColor,
      this.fillColor,
      this.onComplete});

  final int length;
  final double width;
  final double height;

  final Color? fillColor;
  final Color? borderColor;

  final Function(String , TextInputConnection )? onComplete;

  @override
  State<Pinput> createState() => _PinputState();
}

class _PinputState extends State<Pinput> implements TextInputClient {
  late FocusNode _focusNode;
  TextInputConnection? _textInputConnection;
  String _enteredText = '';

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showKeyboard();
    });
  }

  void _showKeyboard() {
    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }

    if (_textInputConnection == null || !_textInputConnection!.attached) {
      _textInputConnection = TextInput.attach(
        this,
        const TextInputConfiguration(
          inputType: TextInputType.number,
          inputAction: TextInputAction.go,
          actionLabel: 'Verify',
        ),
      );
      _textInputConnection?.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.surfaceContainerHigh.withOpacity(.7),
          borderRadius: BorderRadius.circular(10)),
      child: Builder(builder: (context) {
        int currentLength = _enteredText.length;
        if (currentLength >= widget.length) {
          // _enteredText = _enteredText.substring(0, widget.length);
          currentLength = _enteredText.length;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              widget.length, (index) => _pinField(fill: index < currentLength)),
        );
      }),
    );
  }

  Widget _pinField({required bool fill}) {
    return Container(
      width: 8.w,
      height: 8.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: fill
            ? widget.fillColor ??
                Theme.of(context).colorScheme.onPrimaryContainer
            : null,
        border: Border.all(
          width: 1,
          color: widget.borderColor ??
              Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  @override
  void updateEditingValue(TextEditingValue value) {
    setState(() {
      String newText = value.text;
      if (newText.length <= widget.length) {
        _enteredText = newText;
        if (newText.length == widget.length) {
          widget.onComplete?.call(_enteredText , _textInputConnection!);
        }
      } else {
        // Keep existing text if over length limit
        // Limit input to widget's specified length
        TextEditingValue limitedValue = value.copyWith(
            text: value.text.substring(0, widget.length),
            selection: TextSelection.collapsed(offset: widget.length));

        TextInput.updateEditingValue(limitedValue);
        _enteredText = limitedValue.text;
        _textInputConnection?.setEditingState(limitedValue);
      }
    });
  }

  @override
  void performAction(TextInputAction action) {
    if (action == TextInputAction.done) {
      _textInputConnection?.close();
    }
  }

  // Implement other required methods for TextInputClient
  @override
  AutofillScope? get currentAutofillScope => null;

  @override
  void updateFloatingCursor(RawFloatingCursorPoint point) {}

  @override
  void showAutocorrectionPromptRect(int start, int end) {}

  @override
  void connectionClosed() {
    _textInputConnection = null;
  }

  @override
  void didChangeInputControl(
      TextInputControl? oldControl, TextInputControl? newControl) {}

  @override
  void insertContent(KeyboardInsertedContent content) {}

  @override
  void insertTextPlaceholder(Size size) {}

  @override
  void performPrivateCommand(String action, Map<String, dynamic> data) {}

  @override
  void performSelector(String selectorName) {}

  @override
  void removeTextPlaceholder() {}

  @override
  void showToolbar() {}

  @override
  TextEditingValue? get currentTextEditingValue => throw UnimplementedError();
}
