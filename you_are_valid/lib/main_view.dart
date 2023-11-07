// ignore_for_file: library_private_types_in_public_api

part of valid;

/*--------- VIEWS SUBVIEW ----------*/

class ValidBabeyView extends StatefulWidget {
  const ValidBabeyView({super.key});

  @override
  _ValidBabeyViewState createState() => _ValidBabeyViewState();
}

class _ValidBabeyViewState extends State<ValidBabeyView> {
  var messageTextController = TextEditingController();
  List<Widget> messages = [];
  Widget respondToMessage() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: MessageBubbleComponent(
        messageVariant: messagingVariants.receiver,
        messageBody: "You are valid.",
        currentStatus: communicationStatus.delivered,
      ),
    );
  }

  Widget addMessage(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MessageBubbleComponent(
        messageVariant: messagingVariants.sender,
        messageBody: message,
        currentStatus: communicationStatus.delivered,
      ),
    );
  }

  void createMessage(String message) {
    setState(() {
      var sent = addMessage(message);
      messages.add(sent);

      var received = respondToMessage();
      messages.add(received);

      messageTextController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var messageContainer = SizedBox(
      height: screenSize.height * 2,
      child: SingleChildScrollView(
        child: Column(
          children: messages,
        ),
      ),
    );

    var textField = SendFieldComponent(
      onSend: () {
        createMessage(messageTextController.text);
      },
      textEditController: messageTextController,
    );

    var viewWrapper = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        Column(
          children: messages,
        ),
        const SizedBox(height: 10),
        textField,
      ],
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewWrapper,
      showQuickActionBar: false,
      shouldManageNotifications: false,
    );
  }
}
