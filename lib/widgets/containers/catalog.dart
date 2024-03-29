import 'package:apollo/models/company_account.dart';
import 'package:apollo/repositories/company_repository.dart';
import 'package:apollo/screens/shared/company_detail.dart';
import 'package:apollo/shared/constants/colors.dart';
import 'package:apollo/shared/utils/debounce.dart';
import 'package:apollo/widgets/containers/company_card.dart';
import 'package:apollo/widgets/containers/custom_page_route.dart';
import 'package:apollo/widgets/containers/no_results_found.dart';
import 'package:apollo/widgets/containers/tag.dart';
import 'package:apollo/widgets/elements/fetch_loading.dart';
import 'package:apollo/widgets/elements/rounded_text_field.dart';
import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  final TextEditingController _controller = TextEditingController();

  final CompanyRepository companyRepository = CompanyRepository();

  final List<String> tags;

  Catalog({Key? key, required this.tags}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<CompanyAccount> _companies = [];
  bool loading = false;

  final Debounce _debounce = Debounce(const Duration(milliseconds: 400));

  void fetchCompanies() {
    setState(() {
      loading = true;
    });
    widget.companyRepository.getAll().then((companies) {
      setState(() {
        _companies = companies;
      });
    }).whenComplete(() => setState(() {
          loading = false;
        }));
  }

  void searchCompanies(String text) {
    setState(() {
      loading = true;
    });
    if (text.isNotEmpty) {
      widget.companyRepository.search(text).then((companies) {
        setState(() {
          _companies = companies;
        });
      }).whenComplete(() => {
            setState(() {
              loading = false;
            })
          });
    } else {
      widget.companyRepository.getAll().then((companies) {
        setState(() {
          _companies = companies;
        });
      }).whenComplete(() => {
            setState(() {
              loading = false;
            })
          });
    }
  }

  @override
  void initState() {
    loading = true;
    fetchCompanies();
    super.initState();
  }

  Widget _renderTagsListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.tags.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.all(5),
            child: Tag(
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
                borderRadius: 30,
                backgroundColor: kTagUnselectedColor,
                content: widget.tags[index]));
      },
    );
  }

  Widget _renderSearchSection() {
    return Container(
        margin: const EdgeInsets.only(top: 18, bottom: 18, left: 20),
        child: Row(
          children: [
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 220),
                child: RoundedTextField(
                  label: "Do que você precisa?",
                  labelFontSize: 15,
                  autoFocus: false,
                  labelFontWeight: FontWeight.w400,
                  controller: widget._controller,
                  icon: Icons.search,
                  borderRadius: 25,
                  onChanged: (text) {
                    _debounce(() {
                      searchCompanies(text);
                    });
                  },
                )),
            Expanded(
                child: Container(
                    height: 35,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: _renderTagsListView())),
          ],
        ));
  }

  Widget _renderCompanies() {
    return _companies.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: _companies.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CompanyCard(
                  company: _companies[index],
                  onTap: () {
                    Navigator.of(context).push(CustomPageRoute(
                        child: CompanyDetail(
                          company: _companies[index],
                        ),
                        direction: AxisDirection.up));
                  });
            })
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: const NoResultsFound(
                iconData: Icons.search_off,
                textSize: 14,
                text:
                    "Não foi encontrado nenhum estabelecimento a partir desta busca"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 19),
            child: Text(
              'Catálogo',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _renderSearchSection(),
        Flexible(child: loading ? const FetchLoading() : _renderCompanies()),
      ],
    );
  }
}
