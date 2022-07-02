import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode balanceNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 240));
      nameNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    balanceController.dispose();
    nameNode.dispose();
    balanceNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      builder: (context, service, child) {
        return GestureDetector(
          onTap: () {},
          child: Scaffold(
            backgroundColor: TossColor.grey1,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: TossColor.black,
                ),
              ),
              backgroundColor: TossColor.grey1,
              elevation: 0,
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text("확인"),
                ),
              ],
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "은행 추가하기",
                      style: TextStyle(
                        color: TossColor.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("은행명"),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CupertinoTextField.borderless(
                            textAlign: TextAlign.end,
                            controller: nameController,
                            focusNode: nameNode,
                            onSubmitted: (value) {},
                            suffix: const Text("은행"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("잔액"),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CupertinoTextField.borderless(
                            textAlign: TextAlign.end,
                            controller: balanceController,
                            focusNode: balanceNode,
                            keyboardType: TextInputType.number,
                            suffix: const Text("원"),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: TossColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/toss_bank.png'),
                          const Text(
                            "토스 은행",
                            style: TextStyle(
                              color: TossColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "비대면으로 통장을 개설 할 수 있어요",
                            style: TextStyle(
                              color: TossColor.bluegrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              onPrimary: TossColor.white,
                              primary: TossColor.blue,
                            ),
                            child: const Text("지금 바로 만들기"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 52),
                        onPrimary: TossColor.white,
                        primary: TossColor.blue,
                      ),
                      child: const Text("확인"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
