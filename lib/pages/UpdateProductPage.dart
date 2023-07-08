import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/ProductModel.dart';
import 'package:store_app/services/UpdateProductServices.dart';
import 'package:store_app/shared/components/CustomFormTextField.dart';
import 'package:store_app/shared/components/CustomMaterialButton.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, price, image;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Update product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormTextField(
                  onChanged: (value) {
                    productName = value;
                  },
                  labelText: 'Product Name',
                  hintText: 'Enter Product Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                    onChanged: (value) {
                      description = value;
                    },
                    labelText: 'Description',
                    hintText: 'Enter Description'),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      price = value;
                    },
                    labelText: 'Price',
                    hintText: 'Enter Price'),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextField(
                    onChanged: (value) {
                      image = value;
                    },
                    labelText: 'Image',
                    hintText: 'Enter Image'),
                const SizedBox(
                  height: 30,
                ),
                CustomMaterialButton(
                    onPressed: () async{
                      setState(() {
                        isLoading = true;
                      });



                      try {
                       await updateProductMethod(product).then((value) => print('Success'));

                      } catch (e) {
                        print(e.toString());
                      }
                     setState(() {
                       isLoading = false;
                     });
                    },
                    textButton: 'update')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductMethod(ProductModel product) async {
     await UpdateProductServices().updateProduct(
       id: product.id,
        title: (productName==null)?product.title:productName!,
        price:(price==null)?product.price: price!,
        desc: (description==null)?product.description:description!,
        image:(image==null)?product.image: image!,
        category: product.category);
  }
}
