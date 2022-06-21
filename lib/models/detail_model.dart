class DetailModel {
  String? title;
  Product? product;
  int? cartCount;

  DetailModel({this.title, this.product, this.cartCount});

  DetailModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    cartCount = json['cart_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['cart_count'] = this.cartCount;
    return data;
  }
}

class Product {
  int? idPost;
  String? postType;
  String? status;
  String? idCategory;
  String? name;
  String? title;
  String? excerpt;
  String? content;
  String? thumbnail;
  String? fullImage;
  String? inputBy;
  String? inputDate;
  String? editBy;
  String? editDate;
  String? isDelete;
  Option? option;
  List<ProductStock>? productStock;
  List<Categories>? categories;

  Product(
      {this.idPost,
      this.postType,
      this.status,
      this.idCategory,
      this.name,
      this.title,
      this.excerpt,
      this.content,
      this.thumbnail,
      this.fullImage,
      this.inputBy,
      this.inputDate,
      this.editBy,
      this.editDate,
      this.isDelete,
      this.option,
      this.productStock,
      this.categories});

  Product.fromJson(Map<String, dynamic> json) {
    idPost = json['id_post'];
    postType = json['post_type'];
    status = json['status'];
    idCategory = json['id_category'];
    name = json['name'];
    title = json['title'];
    excerpt = json['excerpt'];
    content = json['content'];
    thumbnail = json['thumbnail'];
    fullImage = json['full_image'];
    inputBy = json['input_by'];
    inputDate = json['input_date'];
    editBy = json['edit_by'];
    editDate = json['edit_date'];
    isDelete = json['is_delete'];
    option =
        json['option'] != null ? new Option.fromJson(json['option']) : null;
    if (json['product_stock'] != null) {
      productStock = <ProductStock>[];
      json['product_stock'].forEach((v) {
        productStock!.add(new ProductStock.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_post'] = this.idPost;
    data['post_type'] = this.postType;
    data['status'] = this.status;
    data['id_category'] = this.idCategory;
    data['name'] = this.name;
    data['title'] = this.title;
    data['excerpt'] = this.excerpt;
    data['content'] = this.content;
    data['thumbnail'] = this.thumbnail;
    data['full_image'] = this.fullImage;
    data['input_by'] = this.inputBy;
    data['input_date'] = this.inputDate;
    data['edit_by'] = this.editBy;
    data['edit_date'] = this.editDate;
    data['is_delete'] = this.isDelete;
    if (this.option != null) {
      data['option'] = this.option!.toJson();
    }
    if (this.productStock != null) {
      data['product_stock'] =
          this.productStock!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Option {
  int? idProductOption;
  int? idPost;
  int? price;
  int? beginPrice;
  String? stock;
  String? size;
  String? color;
  String? weight;
  String? width;
  String? height;
  String? length;
  int? star;
  String? tag;
  int? viewCount;
  String? picture1;
  String? picture2;
  String? picture3;
  String? picture4;
  String? picture5;
  String? picture6;
  String? picture7;
  String? picture8;
  String? picture9;
  String? picture10;

  Option(
      {this.idProductOption,
      this.idPost,
      this.price,
      this.beginPrice,
      this.stock,
      this.size,
      this.color,
      this.weight,
      this.width,
      this.height,
      this.length,
      this.star,
      this.tag,
      this.viewCount,
      this.picture1,
      this.picture2,
      this.picture3,
      this.picture4,
      this.picture5,
      this.picture6,
      this.picture7,
      this.picture8,
      this.picture9,
      this.picture10});

  Option.fromJson(Map<String, dynamic> json) {
    idProductOption = json['id_product_option'];
    idPost = json['id_post'];
    price = json['price'];
    beginPrice = json['begin_price'];
    stock = json['stock'];
    size = json['size'];
    color = json['color'];
    weight = json['weight'];
    width = json['width'];
    height = json['height'];
    length = json['length'];
    star = json['star'];
    tag = json['tag'];
    viewCount = json['view_count'];
    picture1 = json['picture_1'];
    picture2 = json['picture_2'];
    picture3 = json['picture_3'];
    picture4 = json['picture_4'];
    picture5 = json['picture_5'];
    picture6 = json['picture_6'];
    picture7 = json['picture_7'];
    picture8 = json['picture_8'];
    picture9 = json['picture_9'];
    picture10 = json['picture_10'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_product_option'] = this.idProductOption;
    data['id_post'] = this.idPost;
    data['price'] = this.price;
    data['begin_price'] = this.beginPrice;
    data['stock'] = this.stock;
    data['size'] = this.size;
    data['color'] = this.color;
    data['weight'] = this.weight;
    data['width'] = this.width;
    data['height'] = this.height;
    data['length'] = this.length;
    data['star'] = this.star;
    data['tag'] = this.tag;
    data['view_count'] = this.viewCount;
    data['picture_1'] = this.picture1;
    data['picture_2'] = this.picture2;
    data['picture_3'] = this.picture3;
    data['picture_4'] = this.picture4;
    data['picture_5'] = this.picture5;
    data['picture_6'] = this.picture6;
    data['picture_7'] = this.picture7;
    data['picture_8'] = this.picture8;
    data['picture_9'] = this.picture9;
    data['picture_10'] = this.picture10;
    return data;
  }
}

class ProductStock {
  int? idStock;
  int? idPost;
  String? color;
  String? size;
  int? stock;

  ProductStock({this.idStock, this.idPost, this.color, this.size, this.stock});

  ProductStock.fromJson(Map<String, dynamic> json) {
    idStock = json['id_stock'];
    idPost = json['id_post'];
    color = json['color'];
    size = json['size'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_stock'] = this.idStock;
    data['id_post'] = this.idPost;
    data['color'] = this.color;
    data['size'] = this.size;
    data['stock'] = this.stock;
    return data;
  }
}

class Categories {
  int? idCategoryLink;
  int? idCategory;
  int? idPost;

  Categories({this.idCategoryLink, this.idCategory, this.idPost});

  Categories.fromJson(Map<String, dynamic> json) {
    idCategoryLink = json['id_category_link'];
    idCategory = json['id_category'];
    idPost = json['id_post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_category_link'] = this.idCategoryLink;
    data['id_category'] = this.idCategory;
    data['id_post'] = this.idPost;
    return data;
  }
}
