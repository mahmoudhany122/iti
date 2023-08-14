import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfApp extends StatelessWidget {
  const InfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("تطبيق مبيعات الكترونيه بمحتلف انواعها",
          style: TextStyle(
          color: Colors.black
        ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column
            (
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              SizedBox(
                height: 5,
              ),
              Text(
                "on boarding screen : "
                "يحتوى ثلاث صفحات ترحيبيه عند الدخول على التطبيق لاول مره او اضافه ميزه جديده"
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "login or register  : "
                  "الدخول للصفحه الرئسيسيه عند تسجيل الدخول اذا كان لديك حساب على التطبيق"
                      "او عمل حساب باستخدام البريد الالكترونى والرقم السرىبعد ثم التوجيه من صفحه عمل الحساب يتم التسجيل باستخدامهم "
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "product : "
                      "وعند الضغط على زرار تسجيل الدخول يتم توجيهك الى صفحه  التطبيق الرئيسيه شريط تنقل فى الاسفل يحتوى على( المنتجات و الاصناف و البروفايل ) تحتوى على المنتجات ومنتجات الكترونيه بمختلف انواعها ولكل منتج معلوماته  مثل الاسم السعر الحالى والقديم والخصم ان وجد تحتوى على انواع المنتجات"
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "profile screen  : "
                     "صفحه الحساب الشخصى تحتوى على خيارين الاول تعديل حسابك والثانى تسجيل الخروج من حسابكعند الدخول على تعديل حسابك تقوم بتعديل رقم البريد او الباسورد ثم حفظه"
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "menu side : "
                     "قائمه منسدله بها معلومات مثل الصوره وبعض الصفحات كالمطور والخروج من التطبيق ومعلومات عن التطبيق "
              ),
            ],
          ),
        ),
      ),

    );
  }
}
