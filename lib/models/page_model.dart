class PageModel {
  String? title;
  Page? page;
  // Package? package;
  // List<Null>? historyBelanja;
  // List<Null>? wishlist;
  // List<Null>? invoice;
  // List<Null>? shoppingCart;
  // MainMenu? mainMenu;
  int? cartCount;
  String? features;
  List<Provinsi>? provinsi;

  PageModel(
      {this.title,
      this.page,
      // this.package, this.historyBelanja, this.wishlist, this.invoice, this.shoppingCart, this.mainMenu,
      this.cartCount,
      this.features,
      this.provinsi});

  PageModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    // package = json['package'] != null ? new Package.fromJson(json['package']) : null;
    // if (json['history_belanja'] != null) {
    // 	historyBelanja = <Null>[];
    // 	json['history_belanja'].forEach((v) { historyBelanja!.add(new Null.fromJson(v)); });
    // }
    // if (json['wishlist'] != null) {
    // 	wishlist = <Null>[];
    // 	json['wishlist'].forEach((v) { wishlist!.add(new Null.fromJson(v)); });
    // }
    // if (json['invoice'] != null) {
    // 	invoice = <Null>[];
    // 	json['invoice'].forEach((v) { invoice!.add(new Null.fromJson(v)); });
    // }
    // if (json['shopping_cart'] != null) {
    // 	shoppingCart = <Null>[];
    // 	json['shopping_cart'].forEach((v) { shoppingCart!.add(new Null.fromJson(v)); });
    // }
    // mainMenu = json['main_menu'] != null ? new MainMenu.fromJson(json['main_menu']) : null;
    cartCount = json['cart_count'];
    features = json['features'];
    if (json['provinsi'] != null) {
      provinsi = <Provinsi>[];
      json['provinsi'].forEach((v) {
        provinsi!.add(new Provinsi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    // if (this.package != null) {
    //   data['package'] = this.package!.toJson();
    // }
    // if (this.historyBelanja != null) {
    //   data['history_belanja'] = this.historyBelanja!.map((v) => v.toJson()).toList();
    // }
    // if (this.wishlist != null) {
    //   data['wishlist'] = this.wishlist!.map((v) => v.toJson()).toList();
    // }
    // if (this.invoice != null) {
    //   data['invoice'] = this.invoice!.map((v) => v.toJson()).toList();
    // }
    // if (this.shoppingCart != null) {
    //   data['shopping_cart'] = this.shoppingCart!.map((v) => v.toJson()).toList();
    // }
    // if (this.mainMenu != null) {
    //   data['main_menu'] = this.mainMenu!.toJson();
    // }
    data['cart_count'] = this.cartCount;
    data['features'] = this.features;
    // if (this.provinsi != null) {
    //   data['provinsi'] = this.provinsi!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Page {
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

  Page(
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
      this.isDelete});

  Page.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

// class Package {

// 	Package({});

// 	Package.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }

// class MainMenu {
// 	1? 11;
// 	2? 22;
// 	2? 23;
// 	2? 24;
// 	2? 25;

// 	MainMenu({this.11, this.22, this.23, this.24, this.25});

// 	MainMenu.fromJson(Map<String, dynamic> json) {
// 		11 = json['1'] != null ? new 1.fromJson(json['1']) : null;
// 		22 = json['2'] != null ? new 2.fromJson(json['2']) : null;
// 		23 = json['3'] != null ? new 2.fromJson(json['3']) : null;
// 		24 = json['4'] != null ? new 2.fromJson(json['4']) : null;
// 		25 = json['5'] != null ? new 2.fromJson(json['5']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.11 != null) {
//       data['1'] = this.11!.toJson();
//     }
// 		if (this.22 != null) {
//       data['2'] = this.22!.toJson();
//     }
// 		if (this.23 != null) {
//       data['3'] = this.23!.toJson();
//     }
// 		if (this.24 != null) {
//       data['4'] = this.24!.toJson();
//     }
// 		if (this.25 != null) {
//       data['5'] = this.25!.toJson();
//     }
// 		return data;
// 	}
// }

// class 1 {
// 	int? idMenu;
// 	String? parentId1;
// 	String? parentId2;
// 	String? parentId3;
// 	int? menuPosition;
// 	String? namaMenu;
// 	String? linkMenu;
// 	String? iconMenu;
// 	String? menuType;
// 	String? inputBy;
// 	String? inputDate;
// 	String? updateBy;
// 	String? updateDate;
// 	String? deleteBy;
// 	String? deleteDate;
// 	String? isDelete;
// 	List<Null>? child;

// 	1({this.idMenu, this.parentId1, this.parentId2, this.parentId3, this.menuPosition, this.namaMenu, this.linkMenu, this.iconMenu, this.menuType, this.inputBy, this.inputDate, this.updateBy, this.updateDate, this.deleteBy, this.deleteDate, this.isDelete, this.child});

// 	1.fromJson(Map<String, dynamic> json) {
// 		idMenu = json['id_menu'];
// 		parentId1 = json['parent_id_1'];
// 		parentId2 = json['parent_id_2'];
// 		parentId3 = json['parent_id_3'];
// 		menuPosition = json['menu_position'];
// 		namaMenu = json['nama_menu'];
// 		linkMenu = json['link_menu'];
// 		iconMenu = json['icon_menu'];
// 		menuType = json['menu_type'];
// 		inputBy = json['input_by'];
// 		inputDate = json['input_date'];
// 		updateBy = json['update_by'];
// 		updateDate = json['update_date'];
// 		deleteBy = json['delete_by'];
// 		deleteDate = json['delete_date'];
// 		isDelete = json['is_delete'];
// 		if (json['child'] != null) {
// 			child = <Null>[];
// 			json['child'].forEach((v) { child!.add(new Null.fromJson(v)); });
// 		}
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['id_menu'] = this.idMenu;
// 		data['parent_id_1'] = this.parentId1;
// 		data['parent_id_2'] = this.parentId2;
// 		data['parent_id_3'] = this.parentId3;
// 		data['menu_position'] = this.menuPosition;
// 		data['nama_menu'] = this.namaMenu;
// 		data['link_menu'] = this.linkMenu;
// 		data['icon_menu'] = this.iconMenu;
// 		data['menu_type'] = this.menuType;
// 		data['input_by'] = this.inputBy;
// 		data['input_date'] = this.inputDate;
// 		data['update_by'] = this.updateBy;
// 		data['update_date'] = this.updateDate;
// 		data['delete_by'] = this.deleteBy;
// 		data['delete_date'] = this.deleteDate;
// 		data['is_delete'] = this.isDelete;
// 		if (this.child != null) {
//       data['child'] = this.child!.map((v) => v.toJson()).toList();
//     }
// 		return data;
// 	}
// }

// class 2 {
// 	int? idMenu;
// 	String? parentId1;
// 	String? parentId2;
// 	String? parentId3;
// 	int? menuPosition;
// 	String? namaMenu;
// 	String? linkMenu;
// 	String? iconMenu;
// 	String? menuType;
// 	String? inputBy;
// 	String? inputDate;
// 	String? updateBy;
// 	String? updateDate;
// 	String? deleteBy;
// 	String? deleteDate;
// 	String? isDelete;
// 	List<Null>? child;

// 	2({this.idMenu, this.parentId1, this.parentId2, this.parentId3, this.menuPosition, this.namaMenu, this.linkMenu, this.iconMenu, this.menuType, this.inputBy, this.inputDate, this.updateBy, this.updateDate, this.deleteBy, this.deleteDate, this.isDelete, this.child});

// 	2.fromJson(Map<String, dynamic> json) {
// 		idMenu = json['id_menu'];
// 		parentId1 = json['parent_id_1'];
// 		parentId2 = json['parent_id_2'];
// 		parentId3 = json['parent_id_3'];
// 		menuPosition = json['menu_position'];
// 		namaMenu = json['nama_menu'];
// 		linkMenu = json['link_menu'];
// 		iconMenu = json['icon_menu'];
// 		menuType = json['menu_type'];
// 		inputBy = json['input_by'];
// 		inputDate = json['input_date'];
// 		updateBy = json['update_by'];
// 		updateDate = json['update_date'];
// 		deleteBy = json['delete_by'];
// 		deleteDate = json['delete_date'];
// 		isDelete = json['is_delete'];
// 		if (json['child'] != null) {
// 			child = <Null>[];
// 			json['child'].forEach((v) { child!.add(new Null.fromJson(v)); });
// 		}
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['id_menu'] = this.idMenu;
// 		data['parent_id_1'] = this.parentId1;
// 		data['parent_id_2'] = this.parentId2;
// 		data['parent_id_3'] = this.parentId3;
// 		data['menu_position'] = this.menuPosition;
// 		data['nama_menu'] = this.namaMenu;
// 		data['link_menu'] = this.linkMenu;
// 		data['icon_menu'] = this.iconMenu;
// 		data['menu_type'] = this.menuType;
// 		data['input_by'] = this.inputBy;
// 		data['input_date'] = this.inputDate;
// 		data['update_by'] = this.updateBy;
// 		data['update_date'] = this.updateDate;
// 		data['delete_by'] = this.deleteBy;
// 		data['delete_date'] = this.deleteDate;
// 		data['is_delete'] = this.isDelete;
// 		if (this.child != null) {
//       data['child'] = this.child!.map((v) => v.toJson()).toList();
//     }
// 		return data;
// 	}
// }

// class MainMenu {
// 	1? 11;
// 	2? 22;
// 	2? 23;
// 	2? 24;
// 	2? 25;

// 	MainMenu({this.11, this.22, this.23, this.24, this.25});

// 	MainMenu.fromJson(Map<String, dynamic> json) {
// 		11 = json['1'] != null ? new 1.fromJson(json['1']) : null;
// 		22 = json['2'] != null ? new 2.fromJson(json['2']) : null;
// 		23 = json['3'] != null ? new 2.fromJson(json['3']) : null;
// 		24 = json['4'] != null ? new 2.fromJson(json['4']) : null;
// 		25 = json['5'] != null ? new 2.fromJson(json['5']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.11 != null) {
//       data['1'] = this.11!.toJson();
//     }
// 		if (this.22 != null) {
//       data['2'] = this.22!.toJson();
//     }
// 		if (this.23 != null) {
//       data['3'] = this.23!.toJson();
//     }
// 		if (this.24 != null) {
//       data['4'] = this.24!.toJson();
//     }
// 		if (this.25 != null) {
//       data['5'] = this.25!.toJson();
//     }
// 		return data;
// 	}
// }
class Provinsi {
  int? idProvinsi;
  String? provinsi;

  Provinsi({this.idProvinsi, this.provinsi});

  Provinsi.fromJson(Map<String, dynamic> json) {
    idProvinsi = json['id_provinsi'];
    provinsi = json['provinsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_provinsi'] = this.idProvinsi;
    data['provinsi'] = this.provinsi;
    return data;
  }
}
