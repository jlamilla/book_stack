// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_stack_database.dart';

// ignore_for_file: type=lint
class $BookFavoritesTable extends BookFavorites
    with TableInfo<$BookFavoritesTable, BookFavorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookFavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtitleMeta = const VerificationMeta(
    'subtitle',
  );
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
    'subtitle',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isbn13Meta = const VerificationMeta('isbn13');
  @override
  late final GeneratedColumn<String> isbn13 = GeneratedColumn<String>(
    'isbn13',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    subtitle,
    isbn13,
    price,
    image,
    url,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'book_favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookFavorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(
        _subtitleMeta,
        subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta),
      );
    }
    if (data.containsKey('isbn13')) {
      context.handle(
        _isbn13Meta,
        isbn13.isAcceptableOrUnknown(data['isbn13']!, _isbn13Meta),
      );
    } else if (isInserting) {
      context.missing(_isbn13Meta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookFavorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookFavorite(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      subtitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subtitle'],
      ),
      isbn13: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}isbn13'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price'],
      ),
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
    );
  }

  @override
  $BookFavoritesTable createAlias(String alias) {
    return $BookFavoritesTable(attachedDatabase, alias);
  }
}

class BookFavorite extends DataClass implements Insertable<BookFavorite> {
  final int id;
  final String title;
  final String? subtitle;
  final String isbn13;
  final String? price;
  final String? image;
  final String? url;
  const BookFavorite({
    required this.id,
    required this.title,
    this.subtitle,
    required this.isbn13,
    this.price,
    this.image,
    this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || subtitle != null) {
      map['subtitle'] = Variable<String>(subtitle);
    }
    map['isbn13'] = Variable<String>(isbn13);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<String>(price);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  BookFavoritesCompanion toCompanion(bool nullToAbsent) {
    return BookFavoritesCompanion(
      id: Value(id),
      title: Value(title),
      subtitle: subtitle == null && nullToAbsent
          ? const Value.absent()
          : Value(subtitle),
      isbn13: Value(isbn13),
      price: price == null && nullToAbsent
          ? const Value.absent()
          : Value(price),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory BookFavorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookFavorite(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String?>(json['subtitle']),
      isbn13: serializer.fromJson<String>(json['isbn13']),
      price: serializer.fromJson<String?>(json['price']),
      image: serializer.fromJson<String?>(json['image']),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String?>(subtitle),
      'isbn13': serializer.toJson<String>(isbn13),
      'price': serializer.toJson<String?>(price),
      'image': serializer.toJson<String?>(image),
      'url': serializer.toJson<String?>(url),
    };
  }

  BookFavorite copyWith({
    int? id,
    String? title,
    Value<String?> subtitle = const Value.absent(),
    String? isbn13,
    Value<String?> price = const Value.absent(),
    Value<String?> image = const Value.absent(),
    Value<String?> url = const Value.absent(),
  }) => BookFavorite(
    id: id ?? this.id,
    title: title ?? this.title,
    subtitle: subtitle.present ? subtitle.value : this.subtitle,
    isbn13: isbn13 ?? this.isbn13,
    price: price.present ? price.value : this.price,
    image: image.present ? image.value : this.image,
    url: url.present ? url.value : this.url,
  );
  BookFavorite copyWithCompanion(BookFavoritesCompanion data) {
    return BookFavorite(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      isbn13: data.isbn13.present ? data.isbn13.value : this.isbn13,
      price: data.price.present ? data.price.value : this.price,
      image: data.image.present ? data.image.value : this.image,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookFavorite(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('isbn13: $isbn13, ')
          ..write('price: $price, ')
          ..write('image: $image, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, subtitle, isbn13, price, image, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookFavorite &&
          other.id == this.id &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.isbn13 == this.isbn13 &&
          other.price == this.price &&
          other.image == this.image &&
          other.url == this.url);
}

class BookFavoritesCompanion extends UpdateCompanion<BookFavorite> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> subtitle;
  final Value<String> isbn13;
  final Value<String?> price;
  final Value<String?> image;
  final Value<String?> url;
  const BookFavoritesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.isbn13 = const Value.absent(),
    this.price = const Value.absent(),
    this.image = const Value.absent(),
    this.url = const Value.absent(),
  });
  BookFavoritesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.subtitle = const Value.absent(),
    required String isbn13,
    this.price = const Value.absent(),
    this.image = const Value.absent(),
    this.url = const Value.absent(),
  }) : title = Value(title),
       isbn13 = Value(isbn13);
  static Insertable<BookFavorite> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<String>? isbn13,
    Expression<String>? price,
    Expression<String>? image,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (isbn13 != null) 'isbn13': isbn13,
      if (price != null) 'price': price,
      if (image != null) 'image': image,
      if (url != null) 'url': url,
    });
  }

  BookFavoritesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? subtitle,
    Value<String>? isbn13,
    Value<String?>? price,
    Value<String?>? image,
    Value<String?>? url,
  }) {
    return BookFavoritesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isbn13: isbn13 ?? this.isbn13,
      price: price ?? this.price,
      image: image ?? this.image,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (isbn13.present) {
      map['isbn13'] = Variable<String>(isbn13.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookFavoritesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('isbn13: $isbn13, ')
          ..write('price: $price, ')
          ..write('image: $image, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $BookRatingsTable extends BookRatings
    with TableInfo<$BookRatingsTable, BookRating> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookRatingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _isbn13Meta = const VerificationMeta('isbn13');
  @override
  late final GeneratedColumn<String> isbn13 = GeneratedColumn<String>(
    'isbn13',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, isbn13, rating];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'book_ratings';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookRating> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('isbn13')) {
      context.handle(
        _isbn13Meta,
        isbn13.isAcceptableOrUnknown(data['isbn13']!, _isbn13Meta),
      );
    } else if (isInserting) {
      context.missing(_isbn13Meta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookRating map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookRating(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      isbn13: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}isbn13'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
    );
  }

  @override
  $BookRatingsTable createAlias(String alias) {
    return $BookRatingsTable(attachedDatabase, alias);
  }
}

class BookRating extends DataClass implements Insertable<BookRating> {
  final int id;
  final String isbn13;
  final double rating;
  const BookRating({
    required this.id,
    required this.isbn13,
    required this.rating,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['isbn13'] = Variable<String>(isbn13);
    map['rating'] = Variable<double>(rating);
    return map;
  }

  BookRatingsCompanion toCompanion(bool nullToAbsent) {
    return BookRatingsCompanion(
      id: Value(id),
      isbn13: Value(isbn13),
      rating: Value(rating),
    );
  }

  factory BookRating.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookRating(
      id: serializer.fromJson<int>(json['id']),
      isbn13: serializer.fromJson<String>(json['isbn13']),
      rating: serializer.fromJson<double>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isbn13': serializer.toJson<String>(isbn13),
      'rating': serializer.toJson<double>(rating),
    };
  }

  BookRating copyWith({int? id, String? isbn13, double? rating}) => BookRating(
    id: id ?? this.id,
    isbn13: isbn13 ?? this.isbn13,
    rating: rating ?? this.rating,
  );
  BookRating copyWithCompanion(BookRatingsCompanion data) {
    return BookRating(
      id: data.id.present ? data.id.value : this.id,
      isbn13: data.isbn13.present ? data.isbn13.value : this.isbn13,
      rating: data.rating.present ? data.rating.value : this.rating,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookRating(')
          ..write('id: $id, ')
          ..write('isbn13: $isbn13, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isbn13, rating);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookRating &&
          other.id == this.id &&
          other.isbn13 == this.isbn13 &&
          other.rating == this.rating);
}

class BookRatingsCompanion extends UpdateCompanion<BookRating> {
  final Value<int> id;
  final Value<String> isbn13;
  final Value<double> rating;
  const BookRatingsCompanion({
    this.id = const Value.absent(),
    this.isbn13 = const Value.absent(),
    this.rating = const Value.absent(),
  });
  BookRatingsCompanion.insert({
    this.id = const Value.absent(),
    required String isbn13,
    required double rating,
  }) : isbn13 = Value(isbn13),
       rating = Value(rating);
  static Insertable<BookRating> custom({
    Expression<int>? id,
    Expression<String>? isbn13,
    Expression<double>? rating,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isbn13 != null) 'isbn13': isbn13,
      if (rating != null) 'rating': rating,
    });
  }

  BookRatingsCompanion copyWith({
    Value<int>? id,
    Value<String>? isbn13,
    Value<double>? rating,
  }) {
    return BookRatingsCompanion(
      id: id ?? this.id,
      isbn13: isbn13 ?? this.isbn13,
      rating: rating ?? this.rating,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isbn13.present) {
      map['isbn13'] = Variable<String>(isbn13.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookRatingsCompanion(')
          ..write('id: $id, ')
          ..write('isbn13: $isbn13, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }
}

abstract class _$BookStackDatabase extends GeneratedDatabase {
  _$BookStackDatabase(QueryExecutor e) : super(e);
  $BookStackDatabaseManager get managers => $BookStackDatabaseManager(this);
  late final $BookFavoritesTable bookFavorites = $BookFavoritesTable(this);
  late final $BookRatingsTable bookRatings = $BookRatingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    bookFavorites,
    bookRatings,
  ];
}

typedef $$BookFavoritesTableCreateCompanionBuilder =
    BookFavoritesCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> subtitle,
      required String isbn13,
      Value<String?> price,
      Value<String?> image,
      Value<String?> url,
    });
typedef $$BookFavoritesTableUpdateCompanionBuilder =
    BookFavoritesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> subtitle,
      Value<String> isbn13,
      Value<String?> price,
      Value<String?> image,
      Value<String?> url,
    });

class $$BookFavoritesTableFilterComposer
    extends Composer<_$BookStackDatabase, $BookFavoritesTable> {
  $$BookFavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BookFavoritesTableOrderingComposer
    extends Composer<_$BookStackDatabase, $BookFavoritesTable> {
  $$BookFavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BookFavoritesTableAnnotationComposer
    extends Composer<_$BookStackDatabase, $BookFavoritesTable> {
  $$BookFavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get isbn13 =>
      $composableBuilder(column: $table.isbn13, builder: (column) => column);

  GeneratedColumn<String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);
}

class $$BookFavoritesTableTableManager
    extends
        RootTableManager<
          _$BookStackDatabase,
          $BookFavoritesTable,
          BookFavorite,
          $$BookFavoritesTableFilterComposer,
          $$BookFavoritesTableOrderingComposer,
          $$BookFavoritesTableAnnotationComposer,
          $$BookFavoritesTableCreateCompanionBuilder,
          $$BookFavoritesTableUpdateCompanionBuilder,
          (
            BookFavorite,
            BaseReferences<
              _$BookStackDatabase,
              $BookFavoritesTable,
              BookFavorite
            >,
          ),
          BookFavorite,
          PrefetchHooks Function()
        > {
  $$BookFavoritesTableTableManager(
    _$BookStackDatabase db,
    $BookFavoritesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookFavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookFavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookFavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> subtitle = const Value.absent(),
                Value<String> isbn13 = const Value.absent(),
                Value<String?> price = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> url = const Value.absent(),
              }) => BookFavoritesCompanion(
                id: id,
                title: title,
                subtitle: subtitle,
                isbn13: isbn13,
                price: price,
                image: image,
                url: url,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> subtitle = const Value.absent(),
                required String isbn13,
                Value<String?> price = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String?> url = const Value.absent(),
              }) => BookFavoritesCompanion.insert(
                id: id,
                title: title,
                subtitle: subtitle,
                isbn13: isbn13,
                price: price,
                image: image,
                url: url,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BookFavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$BookStackDatabase,
      $BookFavoritesTable,
      BookFavorite,
      $$BookFavoritesTableFilterComposer,
      $$BookFavoritesTableOrderingComposer,
      $$BookFavoritesTableAnnotationComposer,
      $$BookFavoritesTableCreateCompanionBuilder,
      $$BookFavoritesTableUpdateCompanionBuilder,
      (
        BookFavorite,
        BaseReferences<_$BookStackDatabase, $BookFavoritesTable, BookFavorite>,
      ),
      BookFavorite,
      PrefetchHooks Function()
    >;
typedef $$BookRatingsTableCreateCompanionBuilder =
    BookRatingsCompanion Function({
      Value<int> id,
      required String isbn13,
      required double rating,
    });
typedef $$BookRatingsTableUpdateCompanionBuilder =
    BookRatingsCompanion Function({
      Value<int> id,
      Value<String> isbn13,
      Value<double> rating,
    });

class $$BookRatingsTableFilterComposer
    extends Composer<_$BookStackDatabase, $BookRatingsTable> {
  $$BookRatingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BookRatingsTableOrderingComposer
    extends Composer<_$BookStackDatabase, $BookRatingsTable> {
  $$BookRatingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn13 => $composableBuilder(
    column: $table.isbn13,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BookRatingsTableAnnotationComposer
    extends Composer<_$BookStackDatabase, $BookRatingsTable> {
  $$BookRatingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get isbn13 =>
      $composableBuilder(column: $table.isbn13, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);
}

class $$BookRatingsTableTableManager
    extends
        RootTableManager<
          _$BookStackDatabase,
          $BookRatingsTable,
          BookRating,
          $$BookRatingsTableFilterComposer,
          $$BookRatingsTableOrderingComposer,
          $$BookRatingsTableAnnotationComposer,
          $$BookRatingsTableCreateCompanionBuilder,
          $$BookRatingsTableUpdateCompanionBuilder,
          (
            BookRating,
            BaseReferences<_$BookStackDatabase, $BookRatingsTable, BookRating>,
          ),
          BookRating,
          PrefetchHooks Function()
        > {
  $$BookRatingsTableTableManager(
    _$BookStackDatabase db,
    $BookRatingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookRatingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookRatingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookRatingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> isbn13 = const Value.absent(),
                Value<double> rating = const Value.absent(),
              }) =>
                  BookRatingsCompanion(id: id, isbn13: isbn13, rating: rating),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String isbn13,
                required double rating,
              }) => BookRatingsCompanion.insert(
                id: id,
                isbn13: isbn13,
                rating: rating,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BookRatingsTableProcessedTableManager =
    ProcessedTableManager<
      _$BookStackDatabase,
      $BookRatingsTable,
      BookRating,
      $$BookRatingsTableFilterComposer,
      $$BookRatingsTableOrderingComposer,
      $$BookRatingsTableAnnotationComposer,
      $$BookRatingsTableCreateCompanionBuilder,
      $$BookRatingsTableUpdateCompanionBuilder,
      (
        BookRating,
        BaseReferences<_$BookStackDatabase, $BookRatingsTable, BookRating>,
      ),
      BookRating,
      PrefetchHooks Function()
    >;

class $BookStackDatabaseManager {
  final _$BookStackDatabase _db;
  $BookStackDatabaseManager(this._db);
  $$BookFavoritesTableTableManager get bookFavorites =>
      $$BookFavoritesTableTableManager(_db, _db.bookFavorites);
  $$BookRatingsTableTableManager get bookRatings =>
      $$BookRatingsTableTableManager(_db, _db.bookRatings);
}
