import 'package:admin/helpers/Button.dart';
import 'package:admin/helpers/colors.dart';
import 'package:admin/providers/Orders.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderItemTile extends StatefulWidget {
  const OrderItemTile(
      {Key key,
      @required this.height,
      @required this.width,
      this.img,
      this.price,
      this.status,
      this.estDays,
      this.mobile,
      this.id,
      this.update,
      this.updateUI,
      this.orderedDays})
      : super(key: key);

  final double height;
  final double width;
  final String img;
  final String orderedDays;
  final String id;

  final Function update;
  final Function updateUI;
  final String estDays;
  final String status;
  final int price;
  final int mobile;

  @override
  _OrderItemTileState createState() => _OrderItemTileState();
}

class _OrderItemTileState extends State<OrderItemTile> {
  bool clicked = true;
  TextEditingController _statusController;
  String stat;
  @override
  void initState() {
    super.initState();
    _statusController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _statusController.dispose();
  }

  void toggle() {
    setState(() {
      clicked = !clicked;
    });
  }

  bool updateLoading = false;
  void update(String id, String status) async {
    setState(() {
      updateLoading = true;
    });
    await widget.update(id, status);

    toggle();
    setState(() {
      updateLoading = false;
      stat = status;
      print(stat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//        height: height * 0.3,
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                widget.img,
                width: widget.width * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '\$${widget.price}',
                    style: GoogleFonts.roboto(
                        color: Color(KOTPButtonBGColor).withOpacity(0.75),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Ordered ${widget.orderedDays} Days ago',
                    style: GoogleFonts.raleway(
                        color: Color(KOTPButtonBGColor).withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'delivering in ${widget.estDays} Days',
                    style: GoogleFonts.raleway(
                        color: Color(KOTPButtonBGColor).withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: toggle,
                    child: Container(
                      height: widget.height * 0.045,
                      width: widget.width * 0.35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.green, width: 1.5)),
                      alignment: Alignment.center,
                      child: updateLoading
                          ? CircularProgressIndicator()
                          : Text(
                              stat == null ? widget.status : stat,
                              style: GoogleFonts.raleway(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Contact no. ${widget.mobile}',
                    style: GoogleFonts.raleway(
                        color: Color(KOTPButtonBGColor).withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
        clicked
            ? Text('')
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Update Order Status",
                          contentPadding: EdgeInsets.all(25),
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                        cursorColor: Color(KWSTitleColor),
                        controller: _statusController,
                        keyboardType: TextInputType.text,
                        onSubmitted: (val) {
                          toggle();
                        },
                      ),
                    ),
                    buildButton(
                        fontSize: 15,
                        height: 50,
                        icon: Icons.update,
                        iconColor: KWhite,
                        radius: 50,
                        onTap: () {
                          setState(() {
                            update(widget.id, _statusController.text);
                          });
                        },
                        elevation: true,
                        width: 50,
                        bgColor: KHCSButtonBGColor),
                  ],
                ),
              ),
        Divider(
          height: 40,
          color: Colors.grey[300],
          thickness: 1.5,
        )
      ],
    ));
  }
}
