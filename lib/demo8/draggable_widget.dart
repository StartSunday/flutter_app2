import 'package:flutter/material.dart';
class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;
  DraggableWidget({Key key ,this.offset,this.widgetColor}): super(key: key);

  @override
  _DraggableWidgetState createState() =>  _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0,0.0);


  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
          child: Container(
            width: 100,
            height: 100,
            color: widget.widgetColor,
          ),
        feedback: Container(
          width: 100,
          height: 100,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled: (Velocity velocity,Offset offset){
          setState(() {
            this.offset = offset;
          });

        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    offset = widget.offset;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}