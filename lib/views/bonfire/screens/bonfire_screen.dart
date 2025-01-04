import 'package:flutter_svg/svg.dart';
import 'package:stroll_app/app/imports.dart';

class BonfireScreen extends StatefulWidget {
  const BonfireScreen({super.key});

  @override
  State<BonfireScreen> createState() => _BonfireScreenState();
}

class _BonfireScreenState extends State<BonfireScreen> {
  final List<Map<String, String>> options = [
    {"label": "A", "text": "The peace in the early mornings"},
    {"label": "B", "text": "The magical golden hours"},
    {"label": "C", "text": "Wind-down time after dinners"},
    {"label": "D", "text": "The serenity past midnight"},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomLayoutBuilder(
        padHorizontal: 0.0,
        padVertical: 0.0,
        child: Stack(
          children: [
            // Background image
            Container(
              height: 0.6.sh, 
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Dark fade at the bottom
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  "assets/icons/fade.svg",
                  height: 1.sh,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // Content
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Gap(30.h),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Stroll Bonfire',
                              style: GoogleFonts.montserrat(
                                shadows: [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: Colors.black45,
                                    offset: Offset(2.0,2.0), 
                                  ),
                                ],
                                fontSize: 34.sp, fontWeight: FontWeight.w700, color: Color.fromRGBO(204, 200, 255, 1),
                              ),
                            ),
                        
                            Gap(5.w),
                        
                            SvgPicture.asset(
                              "assets/icons/dropdown.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timer_outlined, color: AppColors.white, size: 15.sp),
                                Text(
                                  '22h 00m',
                                  style: GoogleFonts.montserrat(
                                    shadows: [
                                      Shadow(
                                          blurRadius: 0.5,
                                          color: Colors.black45,
                                          offset: Offset(2.0,2.0), 
                                      ),
                                    ],
                                    fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),

                            Gap(10.w),

                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/user.svg",
                                  height: 20.sp, width: 20.sp,
                                  colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                                ), 
                                Text(
                                  '103',
                                  style: GoogleFonts.montserrat(
                                    shadows: [
                                      Shadow(
                                          blurRadius: 0.5,
                                          color: Colors.black45,
                                          offset: Offset(2.0,2.0), 
                                      ),
                                    ],
                                    fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                   
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Color.fromRGBO(18, 21, 24, 0.9), width: 5),
                              ),
                              child: CircleAvatar(
                                radius: 50, // Adjust size of the avatar
                                backgroundImage: AssetImage('assets/images/person.png'), // Replace with your image asset
                              ),
                            ),
                        
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(18, 21, 24, 0.9),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                )
                              ),
                              child: Text(
                                "Angelina, 28",
                                style: GoogleFonts.montserrat(
                              fontSize: 11.sp, fontWeight: FontWeight.w700, color: Color.fromRGBO(245, 245, 245, 1),
                            ),
                              ),
                            ),
                          ],
                        ),

                        Gap(10.h),

                        SizedBox(
                          width: 250.w,
                          child: Text(
                            'What is your favorite time of the day?',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis, maxLines: 2,
                            style: GoogleFonts.montserrat(
                              fontSize: 20.sp, fontWeight: FontWeight.w700, color: Color.fromRGBO(245, 245, 245, 1),
                            ),
                          ),
                        ),
                    
                        Gap(10.h),
                    
                        Text(
                          '“Mine is definitely the peace in the morning.”',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontStyle: FontStyle.italic, fontSize: 12.sp, fontWeight: FontWeight.w400, color: Color.fromRGBO(203, 201, 255, 0.7),
                          ),
                        ),
                    
                        // Gap(20.h),
                    
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 3.2,
                          ),
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            final option = options[index];
                            final isSelected = selectedIndex == index;
                    
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(35, 42, 46, 1),
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: isSelected
                                    ? Border.all(color: AppColors.primaryColor, width: 2)
                                    : null,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                child: Row(
                                  children: [
                    
                                    Container(
                                      height: 20.h,
                                      width: 20.h,
                                      decoration: BoxDecoration(
                                        color: isSelected ? AppColors.primaryColor : Colors.transparent, 
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected ? AppColors.primaryColor : Colors.white, 
                                          width: 1
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          option['label']!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    
                                    Gap(10.w),
                    
                                    Expanded(
                                      child: Text(
                                        option['text']!,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.sp, fontWeight: FontWeight.w400, color: Color.fromRGBO(196, 196, 196, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                    
                        Gap(10.h),
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pick your option.',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.white,
                                  ),
                                ),
                    
                                Text(
                                  'See who has a similar mind.',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                    
                            Row(
                              children: [
                                Container(
                                  height: 48.h,
                                  width: 48.w,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.primaryColor, width: 1),
                                  ),
                                  child: Center(
                                    child:  SvgPicture.asset("assets/icons/mic.svg",
                                      height: 26.sp, width: 26.sp,
                                    ), 
                                  ),
                                ),
                    
                                Gap(10.w),
                    
                                Container(
                                  height: 48.h,
                                  width: 48.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(Icons.chevron_right_rounded, color: Colors.black, size: 32.sp,)
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )
              )
            )
          ],
        ),
      ),
    );
  }
}