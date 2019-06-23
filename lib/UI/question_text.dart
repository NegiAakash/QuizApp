import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget
{
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new  QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin
{
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState()
  {
      super.initState();
      _fontSizeAnimationController = new AnimationController(duration: new Duration(milliseconds: 500),vsync: this);
      _fontSizeAnimation = new CurvedAnimation(parent: 
      _fontSizeAnimationController, curve: Curves.decelerate);
      _fontSizeAnimation.addListener(()=>this.setState((){}));
      _fontSizeAnimationController.forward();
  }

  @override
  Widget build(BuildContext context)
  {
    return new Material(
             color: Colors.white,
             child: new Center(
               child: new Container(
                 padding: new EdgeInsets.all(15),
                 child: new Text("Statement "+widget._questionNumber.toString()+" : "+widget._question
                 ,style: new TextStyle(fontSize: _fontSizeAnimation.value* 15),
                 ),
               ),
             ),
           );
  }
}