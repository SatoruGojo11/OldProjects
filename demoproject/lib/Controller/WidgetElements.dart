// import 'package:demoproject/View/Cart_screen.dart';
// import 'package:demoproject/View/Home_screen.dart';
import 'package:demoproject/View/Profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../View/Aboutus_screen.dart';
import '../View/Feedback_screen.dart';
import '../View/Setting_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Widgetselements extends ChangeNotifier {
  Text text(name, {tfftext, size, color, fw, txtdcr}) {
    return Text(
      '$name',
      style: TextStyle(
          decoration: txtdcr,
          color: color ?? Colors.black,
          fontSize: size ?? tfftext ?? 20.0,
          fontWeight: fw ?? FontWeight.normal),
    );
  }

  Container container(color, h1, w1, {dcr, cld}) {
    return Container(
      color: color,
      height: h1,
      width: w1,
      decoration: dcr,
      child: cld,
    );
  }

  Icon icon(icon, {size, clr}) {
    return Icon(
      icon,
      size: size,
      color: clr,
    );
  }

// App name :- 'Trendy bazaar'

  Container txtfmfieldtheme(ctrl, {label, hint, picon, sicon, hide, maxline}) {
    return Container(
      child: TextFormField(
        controller: ctrl,
        maxLines: maxline ?? null,
        minLines: null,
        keyboardType: TextInputType.multiline,
        cursorColor: Colors.black54,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        obscureText: hide ?? false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: '${label != null ? '$label' : ''}',
          labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
          hintText: '${hint != null ? '$hint' : ''}',
          hintStyle: TextStyle(color: Colors.black, fontSize: 14),
          filled: true,
          fillColor: Colors.blue.withOpacity(0.4),
          prefixIcon: picon != null
              ? Icon(picon, size: 25, color: Colors.black)
              : SizedBox(width: 0),
          suffixIcon: sicon != null
              ? Icon(sicon, size: 25, color: Colors.black)
              : SizedBox(width: 0),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "$label Can't be Empty";
          } else {
            return null;
          }
        },
      ),
    );
  }

  FlutterPwValidator pwValidator(ctrl, hpw, wpw) {
    return FlutterPwValidator(
      defaultColor: Colors.black45,
      failureColor: Colors.red,
      successColor: Colors.green,
      width: wpw,
      height: hpw,
      minLength: 8,
      onSuccess: success,
      onFail: fail,
      controller: ctrl,
    );
  }

  success() {
    return "Password Verified";
  }

  fail() {
    return "Password Wrong";
  }

  eb(w1, h1, {color, elevation}) {
    return ElevatedButton.styleFrom(
      backgroundColor: color != null ? color : Colors.transparent,
      elevation: elevation != null ? elevation : 5,
      alignment: Alignment.center,
      fixedSize: Size(w1, h1),
    );
  }

  SnackBar snk(msg, {bclr}) {
    return SnackBar(
      content: text(msg),
      backgroundColor: bclr,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    );
  }

  Container googlenavbar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        child: GNav(
          gap: 5,
          curve: Curves.decelerate,
          haptic: true,
          duration: Duration(milliseconds: 500),
          tabs: [
            GButton(
              haptic: true,
              icon: Icons.home,
              text: 'Home',
              backgroundColor: Colors.white,
              active: true,
              iconColor: Colors.white,
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
              backgroundColor: Colors.white,
              iconColor: Colors.white,
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favourites',
              backgroundColor: Colors.white,
              iconColor: Colors.white,
            ),
            GButton(
              icon: Icons.account_circle,
              text: 'Account',
              backgroundColor: Colors.white,
              iconColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  navigation(screen, ctx) {
    var nav = Navigator.push(
      ctx,
      MaterialPageRoute(builder: (ctx) => screen),
    );
    notifyListeners();
    return nav;
  }

  final List<String> Items = [
    'Themes',
    'Feedback',
    'Setting',
    'About Us',
    'Log out',
  ];

  final List<Widget> Screens = [
    ProfileScreen(),
    Text('Nothing'),
    FeedbackScreen(),
    SettingScreen(),
    AboutusScreen(),
    Text('Nothing'),
  ];

  final List<IconData> Iconsofdrawer = [
    Icons.mode,
    Icons.feedback_outlined,
    Icons.settings,
    Icons.info,
    Icons.logout,
  ];

  drawerofmyapp(h1ofprofile, w1ofmydrawer, clrofprofile, ctx) {
    return Drawer(
      backgroundColor: Colors.white,
      width: w1ofmydrawer,
      child: Column(
        children: [
          Container(
            height: h1ofprofile,
            width: double.maxFinite,
            color: clrofprofile,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () => navigation(Screens[0], ctx),
                    child: CircleAvatar(
                      maxRadius: h1ofprofile / 3.4,
                      child: Image.asset('assets/images/profile_icon.png'),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('     Jaydip Shingala'),
                SizedBox(height: 20),
                Text('     jaydip@gmail.com'),
              ],
            ),
          ),
          ListView.builder(
            itemCount: Items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(Items[index]),
                onTap: () => navigation(Screens[index + 1], ctx),
                leading: Icon(
                  Iconsofdrawer[index],
                  color: Colors.black,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Home page curved Nav bar

  int currentindex = 0;
  curvednavbar(ctx) {
    return CurvedNavigationBar(
      height: 60,
      items: [
        Icon(Icons.home, size: 33, semanticLabel: 'Home'),
        Icon(Icons.shopping_cart, size: 33, semanticLabel: 'Cart'),
        Icon(Icons.search, size: 33, semanticLabel: 'search'),
        Icon(Icons.favorite_border_outlined,
            size: 33, semanticLabel: 'favorite'),
        Icon(Icons.account_circle, size: 33, semanticLabel: 'Profile'),
      ],
      backgroundColor: Colors.amber.shade300,
      buttonBackgroundColor: Colors.green,
      animationCurve: Curves.easeInOut,
      color: Colors.orange,
      animationDuration: Duration(milliseconds: 500),
      index: currentindex,
      onTap: (inneridx) {
        currentindex = inneridx;
        notifyListeners();
      },
    );
  }

  //Home Page Suggested Function

  final List<String> suggestproducts = [
    'https://m.media-amazon.com/images/I/61VfL-aiToL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/41LDfnScXZS._SX300_SY300_QL70_FMwebp_.jpg',
    'https://m.media-amazon.com/images/I/4172H5fFRnL._SX342_SY445_QL70_FMwebp_.jpg',
    'https://m.media-amazon.com/images/I/717kxMoZiAL._AC_UL400_.jpg',
  ];

  final List<String> suggestproductsprice = [
    '-17% ₹1,24,999',
    '-28% ₹66,990',
    '-30% ₹17,490',
    '-90% ₹399',
  ];

  final List<String> suggestproductspriceMrp = [
    '₹1,49,999',
    '₹92,990 ',
    '₹24,999',
    '₹3,999',
  ];
  final List<String> suggestproductsdetails = [
    'Samsung Galaxy S23 Ultra 5G',
    'ASUS TUF Gaming',
    'Samsung 189 L',
    'Lymio Casual Shirt for Men',
  ];

  suggestedst(index, height, width) {
    var data = FittedBox(
      alignment: Alignment.center,
      child: Container(
        height: height / 1.1,
        width: width * 1.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height / 15),
          boxShadow: [
            BoxShadow(
                color: Colors.black87,
                blurRadius: 30,
                blurStyle: BlurStyle.normal),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height / 22),
            Container(
              child: Image.network(
                '${suggestproducts[index]}',
                fit: BoxFit.fill,
              ),
              height: height / 2,
            ),
            SizedBox(height: height / 12),
            Text(
              '${suggestproductsdetails[index]}',
              maxLines: 1,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: height / 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '${suggestproductsprice[index]}',
              style: TextStyle(
                  fontSize: height / 17,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'MRP: ${suggestproductspriceMrp[index]}',
              style: TextStyle(
                fontSize: height / 20,
                decoration: TextDecoration.lineThrough,
              ),
            )
          ],
        ),
      ),
    );
    return data;
  }

  //Home Page Today deals Function

  final List<String> todaydeals = [
    'https://m.media-amazon.com/images/I/41JDyN208GL._SX300_SY300_QL70_FMwebp_.jpg',
    'https://m.media-amazon.com/images/I/61X+EqLmjUL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/41SvD-k7jeL._SX300_SY300_QL70_FMwebp_.jpg',
    'https://m.media-amazon.com/images/I/415hB0+T6QL._SY300_SX300_.jpg',
  ];

  final List<String> todaydealsprice = [
    '-61% ₹549',
    '-32% ₹6,099',
    '-40% ₹15,499',
    '-53% ₹1,399',
  ];

  final List<String> todaydealspriceMrp = [
    '₹1,399',
    '₹8,999',
    '₹26,000',
    '₹2,999',
  ];
  final List<String> todaydealsdetails = [
    'ZEBRONICS Zeb-Thunder',
    'Tecno POP 7 Pro',
    'Lenovo Tab M10',
    'Spotzero by Milton Prime ',
  ];

  todaydealsst(index, height, width) {
    var data = FittedBox(
      alignment: Alignment.center,
      child: Container(
        height: height / 0.7,
        width: width * 2.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height / 15),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 30,
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height / 15),
            Container(
              child: Image.network(
                '${todaydeals[index]}',
                fit: BoxFit.fill,
              ),
              height: height / 1.6,
              width: width * 1.4,
            ),
            SizedBox(height: height / 12),
            Text(
              '${todaydealsdetails[index]}',
              maxLines: 1,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: height / 11, fontWeight: FontWeight.bold),
            ),
            Text(
              '${todaydealsprice[index]}',
              style: TextStyle(
                  fontSize: height / 11,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'MRP: ${todaydealspriceMrp[index]}',
              style: TextStyle(
                fontSize: height / 11,
                decoration: TextDecoration.lineThrough,
              ),
            )
          ],
        ),
      ),
    );
    return data;
  }

  // Card widget of Category Screen

  cardofcategory(img, categoryname, height) {
    return Card(
      elevation: 10,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: height / 6,
            child: Image.network(
              img,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
          // SizedBox(height: height/30,),
          Align(
            alignment: Alignment.bottomCenter,
            child: text(
              categoryname,
              fw: FontWeight.bold,
              size: height / 40,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

/*


GButton(
              icon: ,
              text: 'Home',
            ),
            GButton(
              icon: ,
              text: 'Cart',
            ),
            GButton(
              icon: ,
              text: 'Favourites',
            ),
            GButton(
              icon: ,
              text: 'Account',
            ),

These is for the Search bar page

Container(
                    height: h1 / 12,
                    padding: EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: widgetshortcut.txtfmfieldtheme(
                      _search,
                      hint: 'Search for products',
                      label: 'Search',
                      picon: Icons.search,
                      sicon: Icons.mic,
                    ),
                  ),
 */
