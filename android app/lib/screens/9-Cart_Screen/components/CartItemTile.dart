import 'package:aashas/helpers/constants/Images.dart';
import 'package:aashas/helpers/constants/colors.dart';
import 'package:aashas/providers/CartData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItemTile extends StatefulWidget {
  CartItemTile(
      {Key key,
      @required this.height,
      @required this.width,
      this.size,
      this.price,
      this.id,
      this.title,
      this.qty,
      this.checkAll,
      this.img})
      : super(key: key);

  final double height;
  final String img;
  final double width;
  final String title;
  final bool checkAll;
  final String id;
  final double price;
  final int qty;
  final String size;

  @override
  _CartItemTileState createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  void handleDelete(BuildContext context) {
    Provider.of<CartData>(
      context,
    ).delete(widget.id);
  }

  void handleUpdate(BuildContext context, String type) {
    Provider.of<CartData>(
      context,
    ).updateCart(widget.id, type);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.height * 0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.checkAll
                  ? Checkbox(
                      activeColor: Color(KOTPButtonBGColor),
                      value: widget.checkAll,
                      onChanged: (bool value) {},
                    )
                  : SizedBox(
                      width: 15,
                    ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.raleway(
                              color: Color(KOTPButtonBGColor),
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () => handleDelete(context),
                            child: Icon(
                              FontAwesomeIcons.trashAlt,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$${widget.price}',
                      style: GoogleFonts.roboto(
                          color: Color(KOTPButtonBGColor).withOpacity(0.45),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.size,
                          style: GoogleFonts.raleway(
                              color: Color(KOTPButtonBGColor),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => handleUpdate(context, 'decrement'),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.grey,
                                  size: 12,
                                ),
                              ),
                            ),
                            Text(
                              widget.qty.toString(),
                              style: GoogleFonts.roboto(
                                  color: Color(KOTPButtonBGColor),
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                              onTap: () => handleUpdate(context, 'increment'),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.grey,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
