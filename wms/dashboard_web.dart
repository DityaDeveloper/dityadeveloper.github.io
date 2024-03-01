// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wms/app/utils/widget/datatable/product_datatable/product_datatable.dart';

import '../../../app/utils/extras/textstyle_theme.dart';
import '../../../app/utils/widget/border_container.dart';
import '../../../app/utils/widget/button_icon_widget.dart';
import '../../../app/utils/widget/datatable/company_datatable/company_datatable.dart';
import '../../../app/utils/widget/datatable/product_datatable/product_datasource.dart';
import '../../../app/utils/widget/pie_chart_tier1.dart';
import '../../../data/model/company/company_model.dart';
import '../../../data/model/product_model/product_model.dart';
import '../controller/dashboard_controller.dart';

class DashboardWeb extends StatefulWidget {
  const DashboardWeb({super.key});

  @override
  State<DashboardWeb> createState() => _DashboardWebState();
}

class _DashboardWebState extends State<DashboardWeb> {
  List<Map<String, dynamic>> listdata = [];
  List<CompanyModel> companyData = [];
  List<ProductModel> productData = [];

  late DataSourceProduct dataSourceProduct;
  //late DataSource dataSource;

  DashboardController cDashboard = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    //await cDashboard.companyListData();
    companyData = await cDashboard.companyListData();
    productData = await cDashboard.productListData();
    setState(() {
      companyData = companyData;
    });
    // print(companyData);
    // listdata = [
    //   {'productname': 'arsip 2021', 'qty': '20000', 'date': '25/2/2024'},
    //   {'productname': 'arsip 2022', 'qty': '20000', 'date': '25/2/2024'},
    //   {'productname': 'arsip 2023', 'qty': '20000', 'date': '25/2/2024'},
    //   {'productname': 'arsip 2024', 'qty': '20000', 'date': '25/2/2024'},
    // ];

    // companyData = const [
    //   CompanyModel(uid: '1', companyName: 'company 1', notes: 'note 1'),
    //   CompanyModel(uid: '2', companyName: 'company 2', notes: 'note 2'),
    //   CompanyModel(uid: '3', companyName: 'company 3', notes: 'note 3'),
    // ];
    // Map<String, dynamic> object = {};
    // listdata.forEach((customer) => object[0] = customer.age);;
    // setState(() {
    //   dataSourceProduct = DataSourceProduct(listdata);
    //   dataSource = DataSource(listdata, listdata);
    // });
  }

  @override
  Widget build(BuildContext context) {
    // DataSource dataSource = DataSource(listdata);
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: ListView(
        children: [
          SizedBox(
            height: 90,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dashboards",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                        fontSize: 16),
                  ),
                  ButtonIconWidget(
                    width: 60,
                    backgroundColor: Colors.white,
                    onlyIcon: true,
                    icon: Icons.notifications,
                    padding: 0,
                    onpress: () {
                      cDashboard.createCompany();
                      loaddata();
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
            height:  Get.height * .70,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              BorderContainerWidget(
                                 width: Get.width * .15,
                                height:  Get.height * .15,
                                isgradient: true,
                                isShadow: true,
                                borderColor: Colors.grey.withOpacity(0.3),
                                gradientColor: const [
                                  Color(0xffFFCA51),
                                  Color(0xfFFE5113)
                                ],
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWMSTheme(
                                      label: "Archive",
                                      fontsize: 20,
                                      fontcolor: Colors.white,
                                    ),
                                    TextWMSTheme(
                                      label: "2500",
                                      fontsize: 14,
                                      fontcolor: Colors.white,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BorderContainerWidget(
                                  width: Get.width * .15,
                                height:  Get.height * .15,
                                isgradient: true,
                                isShadow: true,
                                borderColor: Colors.grey.withOpacity(0.3),
                                gradientColor: const [
                                  Color(0xffDAE74E),
                                  Color(0xff00545D)
                                ],
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWMSTheme(
                                      label: "Food",
                                      fontsize: 20,
                                      fontcolor: Colors.white,
                                    ),
                                    TextWMSTheme(
                                      label: "2500",
                                      fontsize: 14,
                                      fontcolor: Colors.white,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BorderContainerWidget(
                                  width: Get.width * .15,
                                height:  Get.height * .15,
                                isgradient: true,
                                isShadow: true,
                                borderColor: Colors.grey.withOpacity(0.3),
                                gradientColor: const [
                                  Color(0xff0096A5),
                                  Color(0xff000585)
                                ],
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWMSTheme(
                                      label: "Devices",
                                      fontsize: 20,
                                      fontcolor: Colors.white,
                                    ),
                                    TextWMSTheme(
                                      label: "2500",
                                      fontsize: 14,
                                      fontcolor: Colors.white,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ))),
                  Expanded(
                      flex: 4,
                      child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  BorderContainerWidget(
                                      width: Get.width * .25,
                                      height:  Get.height * .30,
                                    isgradient: false,
                                    isShadow: true,
                                    color: Colors.white,
                                    borderColor: Colors.black.withOpacity(0.3),
                                    child: const Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextWMSTheme(
                                          label: 'Area Lt.1',
                                        ),
                                        PieChartSample2(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  BorderContainerWidget(
                                       width: Get.width * .25,
                                       height:  Get.height * .30,
                                    isgradient: false,
                                    isShadow: true,
                                    color: Colors.white,
                                    borderColor: Colors.black.withOpacity(0.3),
                                  child: const Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextWMSTheme(
                                          label: 'Area Lt.2',
                                        ),
                                        PieChartSample2(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  BorderContainerWidget(
                                    width: Get.width * .25,
                                       height:  Get.height * .30,
                                    isgradient: false,
                                    isShadow: true,
                                    color: Colors.white,
                                    borderColor: Colors.black.withOpacity(0.3),
                                    child: const Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextWMSTheme(
                                          label: 'Area Lt.3',
                                        ),
                                        PieChartSample2(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  BorderContainerWidget(
                                        width: Get.width * .25,
                                    height:  Get.height * .30,
                                    isgradient: false,
                                    isShadow: true,
                                    color: Colors.white,
                                    borderColor: Colors.black.withOpacity(0.3),
                                    child: const Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TextWMSTheme(
                                          label: 'Area Lt.4',
                                        ),
                                        PieChartSample2(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              BorderContainerWidget(
                                width: Get.width * .15,
                                //height: 340,
                                isgradient: true,
                                isShadow: true,
                                borderColor: Colors.black.withOpacity(0.3),
                                child: const Column(
                                  children: [
                                    SizedBox(height: 5,),
                                     TextWMSTheme(
                                          label: 'Inbound / Outbound',
                                          fontcolor: Colors.white,
                                        ),
                                  ],
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ),
          ),
          /*
          Center(
            child: SizedBox(
              height: 430,
              width: Get.width,
              child: PaginatedDataTable(
                header: const TextWMSTheme(
                  label: "Product",
                  fontsize: 20,
                  fontcolor: Colors.red,
                ),
                actions: const [Icon(Icons.search)],
                source: dataSourceProduct,
                columnSpacing: 5,
                horizontalMargin: 5,
                rowsPerPage: 5,
                showCheckboxColumn: true,
                columns: const [
                  DataColumn(
                    label: SizedBox(
                        width: 100,
                        child: Text(
                          "product name",
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  DataColumn(
                    label: SizedBox(
                        width: 100,
                        child: Text(
                          "qty",
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  DataColumn(
                    label: SizedBox(
                        width: 100,
                        child: Text(
                          "date",
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                ],
              ),
            ),
          ),
          */
          if (productData.isNotEmpty)
            PaginatedDatatableProduct(
              datalist: productData,
            ),
          const SizedBox.shrink()
        ],
      ),
    );
  }
}
