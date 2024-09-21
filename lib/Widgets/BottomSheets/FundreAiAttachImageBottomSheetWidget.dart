import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:groceryshop/Widgets/DotWidget.dart';
import 'package:image_picker/image_picker.dart';
import '../../Repo/ImageRepo.dart';
import '../../Repo/ListRepo.dart';
import '../../Repo/RadiiRepo.dart';
import '../../Repo/ColorRepo.dart';
import '../BottomSheetHandle.dart';
import '../CustomDivider.dart';
import '../CustomTextArea.dart';
import '../ProductCarouselWidget.dart';
import '../QuantityInputWidget.dart';
import '../UserAvatarSmallWidget.dart';
import 'ConfirmMediaAccessBottomSheetWidget.dart';
import 'FundreAiWelcomeBottomSheetWidget.dart';
import '../LoadingBarWidgetLite.dart';
import 'package:path/path.dart' as path;

class FundreAiAttachImageBottomSheetWidget extends StatefulWidget {
  const FundreAiAttachImageBottomSheetWidget({super.key});

  @override
  State<FundreAiAttachImageBottomSheetWidget> createState() => _FundreAiAttachImageBottomSheetWidgetState();
}

class _FundreAiAttachImageBottomSheetWidgetState extends State<FundreAiAttachImageBottomSheetWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  File? _image;
  String _imageFileName = "";
  int _imageFileSize = 0;

  double _imageUploadProgress = 80;

  TextEditingController _quantityController = TextEditingController();

  bool _isLoadingAddToCart = false;
  bool isFundreAiListening = false;
  bool hasChatStarted = false;
  bool _isItemAddedToCartSuccessfully = false;

  String fullName = "Boma Dokubo";
  String email = "bomadokubo@gmail.com";
  String profilePicture = "https://example.com/user_avatar.png";

  String selectedProductImage = "";
  double selectedProductPrice = 0.00;
  String selectedProductName = "";
  String selectedProductDescription = "";

  int _selectedReactionIndex = 0;

  void _uploadImage(){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const ConfirmMediaAccessBottomSheetWidget(),
    ).then((mediaPhoneAccessGranted) {
      if (mediaPhoneAccessGranted) {
        _pickImage();
      }
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final fileSize = await file.length(); // Get file size in bytes

      setState(() {
        print("Successfully picked image");
        _image = file;
        _imageFileName = path.basename(pickedFile.path); // Extract file name with extension
        _imageFileSize = fileSize; // Set file size in bytes
      });
    }
    else{
      print("Failed to pick image");
    }
  }

  String _formatBytes(int bytes, int decimals) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    var i = 0;
    double size = bytes.toDouble();
    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }
    return '${size.toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  void _addQuantity() {
    setState(() {
      int currentQuantity = int.parse(_quantityController.text);
      if (currentQuantity < 10) {
        _quantityController.text = (currentQuantity + 1).toString();
      }
    });
  }

  void _removeQuantity() {
    setState(() {
      int currentQuantity = int.parse(_quantityController.text);
      if (currentQuantity > 1) {
        _quantityController.text = (currentQuantity - 1).toString();
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _addToCart() {
    setState(() {
      _isLoadingAddToCart = true;
    });
  }

  void _navigateTo(int screen) {
    switch (screen) {
      case 0:
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const FundreAiWelcomeBottomSheetWidget(),
        );
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(RadiiRepo.screenPadding),
      color: ColorRepo.background,
      child: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomSheetHandle(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _navigateTo(0);
                        },
                        child: const Icon(
                          PhosphorIcons.caret_left,
                          color: ColorRepo.dark,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(ImageRepo.fundreAiLogoMain, height: 20),
                          const SizedBox(width: 5),
                          Text(
                            ListRepo.companyInfo[0]["AI-Name"],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          ScreenContext.exitText,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ColorRepo.dark,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(ImageRepo.userSoundIcon, height: 56),
                          const SizedBox(width: 5),
                          Text(
                            ScreenContext.headerText[0],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: ColorRepo.muted2),
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(PhosphorIcons.trash, color: ColorRepo.dark, size: 16),
                            const SizedBox(width: 5),
                            Text(
                              ScreenContext.buttonText[0],
                              style: const TextStyle(
                                color: ColorRepo.dark,
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  hasChatStarted
                      ? const SizedBox()
                      : SlideTransition(
                    position: _offsetAnimation,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ScreenContext.headerText[1],
                            style: const TextStyle(
                              color: ColorRepo.primary2,
                              fontFamily: 'Urbanist',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ScreenContext.bodyText[0],
                            style: const TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomDivider(),
                  const SizedBox(height: 20),
                  selectedProductImage.isNotEmpty
                      ? const SizedBox()
                      : SizedBox(
                    height: screenHeight * 0.40,
                    width: screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(ImageRepo.fundreAiLogoChat),
                            const SizedBox(width: 10),
                            const Text(
                              "What do you need help with today?",
                              style: TextStyle(
                                color: ColorRepo.dark,
                                fontFamily: 'Urbanist',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(RadiiRepo.borderRadius),
                                border: Border.all(color: ColorRepo.muted2, width: 0.5),
                                color: ColorRepo.mutedLite,
                              ),
                              child: const Text(
                                "I want a freshly peeled corn",
                                style: TextStyle(
                                  color: ColorRepo.dark,
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            UserAvatarSmallWidget(
                              imageUrl: profilePicture,
                              fullName: fullName,
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Keep shopping these trends",
                                  style: TextStyle(
                                    color: ColorRepo.dark,
                                    fontFamily: 'Urbanist',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: screenWidth - 82,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: ProductCarouselLiteWidget(
                                      products: ListRepo.products,
                                      imageSize: 56,
                                      useCallBackFunction: true,
                                      callBackFunction: (product) {
                                        setState(() {
                                          selectedProductImage = product['image'];
                                          selectedProductPrice = product['price'];
                                          selectedProductName = product['name'];
                                          selectedProductDescription = product['description'];
                                        });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  selectedProductImage.isEmpty? const SizedBox() : SlideTransition(
                    position: _offsetAnimation,
                    child: SizedBox(
                      height: screenHeight * 0.56,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(ImageRepo.fundreAiLogoChat),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${ListRepo.companyInfo[0]["AI-Name"]} Result",
                                      style: const TextStyle(
                                        color: ColorRepo.muted,
                                        fontFamily: 'Urbanist',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height:10),
                                    Row(
                                      children: [
                                        Container(
                                          height: 56,
                                          width: 56,
                                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                              color: ColorRepo.mutedLite2,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Image.network(
                                            selectedProductImage,
                                            height: 56,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              selectedProductName,
                                              style: const TextStyle(
                                                color: ColorRepo.dark,
                                                fontFamily: 'Urbanist',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(height: 10,),
                                            Text(
                                              "₦$selectedProductPrice",
                                              style: const TextStyle(
                                                color: ColorRepo.dark,
                                                fontFamily: 'Urbanist',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(width: screenWidth - 80, height: 1, color: ColorRepo.muted2),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Description",
                                      style: TextStyle(
                                        color: ColorRepo.muted,
                                        fontFamily: 'Urbanist',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: screenWidth * 0.77,
                                      child: Text(
                                        selectedProductDescription,
                                        style: const TextStyle(
                                          color: ColorRepo.dark,
                                          fontFamily: 'Urbanist',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Row(
                                      children: [
                                        Text(
                                          "More info",
                                          style: TextStyle(
                                            color: ColorRepo.link,
                                            fontFamily: 'Urbanist',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Icon(PhosphorIcons.arrow_up_right, color: ColorRepo.link, size: 16),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(width: screenWidth - 80, height: 1, color: ColorRepo.muted2),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: screenWidth * 0.78,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  PhosphorIcons.minus_circle,
                                                  color: ColorRepo.muted,
                                                ),
                                                onPressed: () {
                                                  _removeQuantity();
                                                },
                                                iconSize: 24.0,
                                                padding: EdgeInsets.zero,
                                                constraints: const BoxConstraints(),
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                              ),
                                              QuantityInputWidget(quantityController: _quantityController),
                                              IconButton(
                                                icon: const Icon(
                                                  PhosphorIcons.plus_circle,
                                                  color: ColorRepo.dark,
                                                ),
                                                onPressed: () {
                                                  _addQuantity();
                                                },
                                                iconSize: 24.0,
                                                padding: EdgeInsets.zero,
                                                constraints: const BoxConstraints(),
                                                splashColor: Colors.transparent,
                                                highlightColor: Colors.transparent,
                                              ),
                                            ],
                                          ),
                                          _isLoadingAddToCart ? const Row(children: [
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                AlwaysStoppedAnimation<Color>(ColorRepo.primary2),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                              "Adding item",
                                              style: TextStyle(
                                                color: ColorRepo.primary2,
                                                fontFamily: 'Urbanist',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],) : _isItemAddedToCartSuccessfully ? const Row(children: [
                                            Icon(
                                              PhosphorIcons.check_circle_fill,
                                              color: ColorRepo.successDark,
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                              "Item Added",
                                              style: TextStyle(
                                                color: ColorRepo.dark,
                                                fontFamily: 'Urbanist',
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],) : GestureDetector(
                                            onTap: (){
                                              _addToCart();
                                            },
                                            child: const Row(children: [
                                              Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                  color: ColorRepo.dark,
                                                  fontFamily: 'Urbanist',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Icon(
                                                PhosphorIcons.shopping_cart,
                                                color: ColorRepo.primary2,
                                              ),
                                            ],),
                                          )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 60),
                            _isItemAddedToCartSuccessfully ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "How did we do? Help us get better",
                                  style: TextStyle(
                                    color: ColorRepo.dark,
                                    fontFamily: 'Urbanist',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: screenWidth,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _selectedReactionIndex = 1;
                                          });
                                        },
                                        child: Icon(
                                          _selectedReactionIndex == 1 ? PhosphorIcons.smiley_wink_fill : PhosphorIcons.smiley_wink,
                                          color: _selectedReactionIndex == 1 ? ColorRepo.dark : ColorRepo.muted,
                                          size: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 20,),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _selectedReactionIndex = 2;
                                          });
                                        },
                                        child: Icon(
                                          _selectedReactionIndex == 2 ? PhosphorIcons.smiley_nervous_fill : PhosphorIcons.smiley_nervous,
                                          color: _selectedReactionIndex == 2 ? ColorRepo.dark : ColorRepo.muted,
                                          size: 24,
                                        ),
                                      ),
                                    ],),
                                ),
                                const SizedBox(height: 20),
                                CustomTextArea(labelText: ScreenContext.labelText[0], hintText: ScreenContext.hintText[0]),
                                const SizedBox(height: 320),
                              ],
                            ) : const SizedBox()
                          ],),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Fixed bottom-aligned section
          selectedProductImage.isEmpty && _image == null ? Padding(
            padding: const EdgeInsets.fromLTRB(RadiiRepo.screenPadding, RadiiRepo.screenPadding, RadiiRepo.screenPadding, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: (){
                      _uploadImage();
                    },
                    child: Image.asset(ImageRepo.imagePlaceHolderIconLarge)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Upload item image here.",
                      style: TextStyle(
                        color: ColorRepo.dark,
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: (){
                        _uploadImage();
                      },
                      child: const Text(
                        "browse device",
                        style: TextStyle(
                          color: ColorRepo.link,
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],),
                const SizedBox(height: 10),
                const Text(
                  "JPG, PNG, JPEG2000",
                  style: TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],),
          ) : _image != null || _imageFileName.isNotEmpty ? Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Uploading image...",
                  style: TextStyle(
                    color: ColorRepo.dark,
                    fontFamily: 'Urbanist',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 150,
                  width: screenWidth,
                  // Outer container for the gradient border
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.yellow,
                        Colors.orange,
                        Colors.red,
                        Colors.blue,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20), // Adjust according to RadiiRepo
                  ),
                  padding: const EdgeInsets.all(1.0), // The space for the gradient border
                  child: Container(
                    // Inner container for content
                    decoration: BoxDecoration(
                      color: ColorRepo.background, // The background color of the inner container
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: RadiiRepo.screenPadding, vertical: 14.0),
                    child: Column(
                      children: [
                        Row(children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: ColorRepo.mutedLite2,
                                width: 1.0,
                              ),
                            ),
                            child: _image != null ? Image.file(
                              _image!,
                              height: 50,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ) : const Text('No image found.', style: TextStyle(
                              color: ColorRepo.dark,
                              fontFamily: 'Urbanist',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                              _imageFileName,
                              style: const TextStyle(
                                color: ColorRepo.dark,
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                              const SizedBox(height: 5),
                              Text(
                              "Size: ${_formatBytes(_imageFileSize ?? 0, 2)}",
                              style: const TextStyle(
                                color: ColorRepo.muted,
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],)
                        ],),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "75%",
                                  style: TextStyle(
                                    color: ColorRepo.dark,
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                DotWidget(),
                                SizedBox(width: 5),
                                Text(
                                  "5 seconds left",
                                  style: TextStyle(
                                    color: ColorRepo.dark,
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(children: [
                              Icon(
                                PhosphorIcons.pause_circle,
                                color: ColorRepo.dark,
                                size: 24,
                              ),
                              SizedBox(width: 5),
                              Icon(
                                PhosphorIcons.x_circle,
                                color: ColorRepo.dark,
                                size: 24,
                              ),
                            ],)
                          ],
                        ),
                        const SizedBox(height: 16),
                        LoadingBarWidgetLite(progress: _imageUploadProgress),
                      ],
                    ),
                  ),
                )
              ],),
          ) : Padding(
              padding: const EdgeInsets.all(RadiiRepo.screenPadding),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Upload item image here.",
                      style: TextStyle(
                        color: ColorRepo.dark,
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: (){
                        _uploadImage();
                      },
                      child: const Text(
                        "browse device",
                        style: TextStyle(
                          color: ColorRepo.link,
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(ImageRepo.imagePlaceHolderIcon, height: 40)
                  ],),
              )
          )
        ],
      ),
    );
  }
}

class ScreenContext {
  static const String exitText = "Cancel";
  static List<String> headerText = ["Attach Image", "Hi, I'm ${ListRepo.companyInfo[0]["AI-Name-Short"]}!"];
  static List<String> bodyText = ["I will be taking your order requests. My answers are powered by AI, so i may not always get things right."];
  static const List<String> buttonText = ["Clear Chat"];

  static const List<String> labelText = [
    'Write your review',
  ];

  static const List<String> hintText = [
    '...type in here',
    '...type prompt here',
  ];
}
