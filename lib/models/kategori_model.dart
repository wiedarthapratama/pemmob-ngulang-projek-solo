class KategoriModel {
  String? title;
  Category? category;
  int? cartCount;
  List<CategoryList>? categoryList;
  List<Categories>? categories;
  List<String>? sizes;
  List<ProductList>? productList;

  KategoriModel(
      {this.title,
      this.category,
      this.cartCount,
      this.categoryList,
      this.categories,
      this.sizes,
      this.productList});

  KategoriModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    cartCount = json['cart_count'];
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    sizes = json['sizes'].cast<String>();
    if (json['product_list'] != null) {
      productList = <ProductList>[];
      json['product_list'].forEach((v) {
        productList!.add(new ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['cart_count'] = this.cartCount;
    if (this.categoryList != null) {
      data['category_list'] =
          this.categoryList!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['sizes'] = this.sizes;
    if (this.productList != null) {
      data['product_list'] = this.productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? idCategory;
  int? idParent;
  String? categorySlug;
  String? categoryName;
  String? categoryDescription;
  String? categoryImage;
  String? inputBy;
  String? inputDate;
  String? isDelete;

  Category(
      {this.idCategory,
      this.idParent,
      this.categorySlug,
      this.categoryName,
      this.categoryDescription,
      this.categoryImage,
      this.inputBy,
      this.inputDate,
      this.isDelete});

  Category.fromJson(Map<String, dynamic> json) {
    idCategory = json['id_category'];
    idParent = json['id_parent'];
    categorySlug = json['category_slug'];
    categoryName = json['category_name'];
    categoryDescription = json['category_description'];
    categoryImage = json['category_image'];
    inputBy = json['input_by'];
    inputDate = json['input_date'];
    isDelete = json['is_delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_category'] = this.idCategory;
    data['id_parent'] = this.idParent;
    data['category_slug'] = this.categorySlug;
    data['category_name'] = this.categoryName;
    data['category_description'] = this.categoryDescription;
    data['category_image'] = this.categoryImage;
    data['input_by'] = this.inputBy;
    data['input_date'] = this.inputDate;
    data['is_delete'] = this.isDelete;
    return data;
  }
}

class CategoryList {
  int? idCategory;
  int? idParent;
  String? categorySlug;
  String? categoryName;
  String? categoryDescription;
  String? categoryImage;
  String? inputBy;
  String? inputDate;
  String? isDelete;
  int? postsCount;

  CategoryList(
      {this.idCategory,
      this.idParent,
      this.categorySlug,
      this.categoryName,
      this.categoryDescription,
      this.categoryImage,
      this.inputBy,
      this.inputDate,
      this.isDelete,
      this.postsCount});

  CategoryList.fromJson(Map<String, dynamic> json) {
    idCategory = json['id_category'];
    idParent = json['id_parent'];
    categorySlug = json['category_slug'];
    categoryName = json['category_name'];
    categoryDescription = json['category_description'];
    categoryImage = json['category_image'];
    inputBy = json['input_by'];
    inputDate = json['input_date'];
    isDelete = json['is_delete'];
    postsCount = json['posts_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_category'] = this.idCategory;
    data['id_parent'] = this.idParent;
    data['category_slug'] = this.categorySlug;
    data['category_name'] = this.categoryName;
    data['category_description'] = this.categoryDescription;
    data['category_image'] = this.categoryImage;
    data['input_by'] = this.inputBy;
    data['input_date'] = this.inputDate;
    data['is_delete'] = this.isDelete;
    data['posts_count'] = this.postsCount;
    return data;
  }
}

class ProductList {
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
  int? idProductOption;
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

  ProductList(
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
      this.idProductOption,
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

  ProductList.fromJson(Map<String, dynamic> json) {
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
    idProductOption = json['id_product_option'];
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
    data['id_product_option'] = this.idProductOption;
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

class Categories {
  int? idCategory;
  int? idParent;
  String? categorySlug;
  String? categoryName;
  String? categoryDescription;
  String? categoryImage;
  String? inputBy;
  String? inputDate;
  String? isDelete;
  int? postsCount;

  Categories(
      {this.idCategory,
      this.idParent,
      this.categorySlug,
      this.categoryName,
      this.categoryDescription,
      this.categoryImage,
      this.inputBy,
      this.inputDate,
      this.isDelete,
      this.postsCount});

  Categories.fromJson(Map<String, dynamic> json) {
    idCategory = json['id_category'];
    idParent = json['id_parent'];
    categorySlug = json['category_slug'];
    categoryName = json['category_name'];
    categoryDescription = json['category_description'];
    categoryImage = json['category_image'];
    inputBy = json['input_by'];
    inputDate = json['input_date'];
    isDelete = json['is_delete'];
    postsCount = json['posts_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_category'] = this.idCategory;
    data['id_parent'] = this.idParent;
    data['category_slug'] = this.categorySlug;
    data['category_name'] = this.categoryName;
    data['category_description'] = this.categoryDescription;
    data['category_image'] = this.categoryImage;
    data['input_by'] = this.inputBy;
    data['input_date'] = this.inputDate;
    data['is_delete'] = this.isDelete;
    data['posts_count'] = this.postsCount;
    return data;
  }
}
