.class Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;
.super Lio/flutter/plugin/common/StandardMessageCodec;
.source "FlutterFirebaseFirestoreMessageCodec.java"


# static fields
.field private static final DATA_TYPE_ARRAY_REMOVE:B = -0x47t

.field private static final DATA_TYPE_ARRAY_UNION:B = -0x48t

.field private static final DATA_TYPE_BLOB:B = -0x49t

.field private static final DATA_TYPE_DATE_TIME:B = -0x4ct

.field private static final DATA_TYPE_DELETE:B = -0x46t

.field private static final DATA_TYPE_DOCUMENT_ID:B = -0x41t

.field private static final DATA_TYPE_DOCUMENT_REFERENCE:B = -0x4at

.field private static final DATA_TYPE_FIELD_PATH:B = -0x40t

.field private static final DATA_TYPE_FIRESTORE_INSTANCE:B = -0x3ct

.field private static final DATA_TYPE_FIRESTORE_QUERY:B = -0x3bt

.field private static final DATA_TYPE_FIRESTORE_SETTINGS:B = -0x3at

.field private static final DATA_TYPE_GEO_POINT:B = -0x4bt

.field private static final DATA_TYPE_INCREMENT_DOUBLE:B = -0x43t

.field private static final DATA_TYPE_INCREMENT_INTEGER:B = -0x42t

.field private static final DATA_TYPE_INFINITY:B = -0x3et

.field private static final DATA_TYPE_NAN:B = -0x3ft

.field private static final DATA_TYPE_NEGATIVE_INFINITY:B = -0x3dt

.field private static final DATA_TYPE_SERVER_TIMESTAMP:B = -0x45t

.field private static final DATA_TYPE_TIMESTAMP:B = -0x44t

.field public static final INSTANCE:Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    new-instance v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->INSTANCE:Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lio/flutter/plugin/common/StandardMessageCodec;-><init>()V

    return-void
.end method

.method private filterFromJson(Ljava/util/Map;)Lcom/google/firebase/firestore/Filter;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/firebase/firestore/Filter;"
        }
    .end annotation

    const-string v0, "fieldPath"

    .line 357
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "Invalid operator"

    const-string v3, "op"

    const/4 v4, 0x0

    if-eqz v1, :cond_a

    .line 359
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 360
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/FieldPath;

    const-string v3, "value"

    .line 361
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 364
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    const/4 v3, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :goto_0
    const/4 v4, -0x1

    goto/16 :goto_1

    :sswitch_0
    const-string v4, "array-contains-any"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v4, 0x9

    goto/16 :goto_1

    :sswitch_1
    const-string v4, "array-contains"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const/16 v4, 0x8

    goto :goto_1

    :sswitch_2
    const-string v4, "in"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v4, 0x7

    goto :goto_1

    :sswitch_3
    const-string v4, ">="

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v4, 0x6

    goto :goto_1

    :sswitch_4
    const-string v4, "=="

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v4, 0x5

    goto :goto_1

    :sswitch_5
    const-string v4, "<="

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_0

    :cond_5
    const/4 v4, 0x4

    goto :goto_1

    :sswitch_6
    const-string v4, "!="

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_0

    :cond_6
    const/4 v4, 0x3

    goto :goto_1

    :sswitch_7
    const-string v4, ">"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    goto :goto_0

    :cond_7
    const/4 v4, 0x2

    goto :goto_1

    :sswitch_8
    const-string v4, "<"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    goto :goto_0

    :cond_8
    const/4 v4, 0x1

    goto :goto_1

    :sswitch_9
    const-string v5, "not-in"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    goto :goto_0

    :cond_9
    :goto_1
    packed-switch v4, :pswitch_data_0

    .line 386
    new-instance p1, Ljava/lang/Error;

    invoke-direct {p1, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw p1

    .line 380
    :pswitch_0
    check-cast p1, Ljava/util/List;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->arrayContainsAny(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 378
    :pswitch_1
    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->arrayContains(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 382
    :pswitch_2
    check-cast p1, Ljava/util/List;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->inArray(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 376
    :pswitch_3
    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->greaterThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 366
    :pswitch_4
    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->equalTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 372
    :pswitch_5
    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->lessThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 368
    :pswitch_6
    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->notEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 374
    :pswitch_7
    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->greaterThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 370
    :pswitch_8
    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->lessThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 384
    :pswitch_9
    check-cast p1, Ljava/util/List;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/Filter;->notInArray(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 390
    :cond_a
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "queries"

    .line 391
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 394
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 395
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 396
    invoke-direct {p0, v3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->filterFromJson(Ljava/util/Map;)Lcom/google/firebase/firestore/Filter;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_b
    const-string p1, "OR"

    .line 399
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c

    new-array p1, v4, [Lcom/google/firebase/firestore/Filter;

    .line 400
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/google/firebase/firestore/Filter;

    invoke-static {p1}, Lcom/google/firebase/firestore/Filter;->or([Lcom/google/firebase/firestore/Filter;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    :cond_c
    const-string p1, "AND"

    .line 401
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    new-array p1, v4, [Lcom/google/firebase/firestore/Filter;

    .line 402
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/google/firebase/firestore/Filter;

    invoke-static {p1}, Lcom/google/firebase/firestore/Filter;->and([Lcom/google/firebase/firestore/Filter;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    return-object p1

    .line 405
    :cond_d
    new-instance p1, Ljava/lang/Error;

    invoke-direct {p1, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw p1

    :sswitch_data_0
    .sparse-switch
        -0x3df949a1 -> :sswitch_9
        0x3c -> :sswitch_8
        0x3e -> :sswitch_7
        0x43c -> :sswitch_6
        0x781 -> :sswitch_5
        0x7a0 -> :sswitch_4
        0x7bf -> :sswitch_3
        0xd25 -> :sswitch_2
        0x8111b13 -> :sswitch_1
        0x152d4832 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private readFirestoreInstance(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/FirebaseFirestore;
    .locals 4

    .line 289
    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 290
    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 291
    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    .line 292
    sget-object v2, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->firestoreInstanceCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 293
    :try_start_0
    invoke-static {v0, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreInstanceByNameAndDatabaseUrl(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 296
    invoke-static {v0, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreInstanceByNameAndDatabaseUrl(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    monitor-exit v2

    return-object p1

    .line 300
    :cond_0
    invoke-static {v0}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    .line 301
    invoke-static {v0, v1}, Lcom/google/firebase/firestore/FirebaseFirestore;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v0

    .line 302
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->setFirestoreSettings(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)V

    .line 304
    invoke-static {v0, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->setCachedFirebaseFirestoreInstanceForKey(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;)V

    .line 306
    monitor-exit v2

    return-object v0

    :catchall_0
    move-exception p1

    .line 307
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private readFirestoreQuery(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/Query;
    .locals 8

    const-string v0, "filters"

    const-string v1, "FLTFirestoreMsgCodec"

    .line 411
    :try_start_0
    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    const-string v2, "firestore"

    .line 413
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v2, Lcom/google/firebase/firestore/FirebaseFirestore;

    const-string v3, "path"

    .line 415
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    const-string v4, "isCollectionGroup"

    .line 416
    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    const-string v5, "parameters"

    .line 418
    invoke-interface {p1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-eqz v4, :cond_0

    .line 422
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/FirebaseFirestore;->collectionGroup(Ljava/lang/String;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto :goto_0

    .line 424
    :cond_0
    invoke-virtual {v2, v3}, Lcom/google/firebase/firestore/FirebaseFirestore;->collection(Ljava/lang/String;)Lcom/google/firebase/firestore/CollectionReference;

    move-result-object v2

    :goto_0
    if-nez p1, :cond_1

    return-object v2

    .line 429
    :cond_1
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 431
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-direct {p0, v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->filterFromJson(Ljava/util/Map;)Lcom/google/firebase/firestore/Filter;

    move-result-object v0

    .line 432
    invoke-virtual {v2, v0}, Lcom/google/firebase/firestore/Query;->where(Lcom/google/firebase/firestore/Filter;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    :cond_2
    const-string v0, "where"

    .line 438
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    .line 439
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 440
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/firebase/firestore/FieldPath;

    .line 441
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v6, 0x2

    .line 442
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    const-string v6, "=="

    .line 444
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 445
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto :goto_1

    :cond_3
    const-string v6, "!="

    .line 446
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 447
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereNotEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto :goto_1

    :cond_4
    const-string v6, "<"

    .line 448
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 449
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereLessThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto :goto_1

    :cond_5
    const-string v6, "<="

    .line 450
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 451
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereLessThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto :goto_1

    :cond_6
    const-string v6, ">"

    .line 452
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 453
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereGreaterThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto :goto_1

    :cond_7
    const-string v6, ">="

    .line 454
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 455
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereGreaterThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto :goto_1

    :cond_8
    const-string v6, "array-contains"

    .line 456
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 457
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereArrayContains(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto :goto_1

    :cond_9
    const-string v6, "array-contains-any"

    .line 458
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 460
    check-cast v3, Ljava/util/List;

    .line 461
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereArrayContainsAny(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto/16 :goto_1

    :cond_a
    const-string v6, "in"

    .line 462
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 464
    check-cast v3, Ljava/util/List;

    .line 465
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereIn(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto/16 :goto_1

    :cond_b
    const-string v6, "not-in"

    .line 466
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 468
    check-cast v3, Ljava/util/List;

    .line 469
    invoke-virtual {v2, v5, v3}, Lcom/google/firebase/firestore/Query;->whereNotIn(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto/16 :goto_1

    .line 471
    :cond_c
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "An invalid query operator "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " was received but not handled."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_d
    const-string v0, "limit"

    .line 478
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    if-eqz v0, :cond_e

    .line 479
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lcom/google/firebase/firestore/Query;->limit(J)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    :cond_e
    const-string v0, "limitToLast"

    .line 481
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    if-eqz v0, :cond_f

    .line 482
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lcom/google/firebase/firestore/Query;->limitToLast(J)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    :cond_f
    const-string v0, "orderBy"

    .line 486
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_10

    return-object v2

    .line 489
    :cond_10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_12

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 490
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/firebase/firestore/FieldPath;

    .line 491
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_11

    .line 494
    sget-object v3, Lcom/google/firebase/firestore/Query$Direction;->DESCENDING:Lcom/google/firebase/firestore/Query$Direction;

    goto :goto_3

    :cond_11
    sget-object v3, Lcom/google/firebase/firestore/Query$Direction;->ASCENDING:Lcom/google/firebase/firestore/Query$Direction;

    .line 496
    :goto_3
    invoke-virtual {v2, v6, v3}, Lcom/google/firebase/firestore/Query;->orderBy(Lcom/google/firebase/firestore/FieldPath;Lcom/google/firebase/firestore/Query$Direction;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    goto :goto_2

    :cond_12
    const-string v0, "startAt"

    .line 501
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_13

    .line 502
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v2, v0}, Lcom/google/firebase/firestore/Query;->startAt([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    :cond_13
    const-string v0, "startAfter"

    .line 505
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_14

    .line 507
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v2, v0}, Lcom/google/firebase/firestore/Query;->startAfter([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    :cond_14
    const-string v0, "endAt"

    .line 510
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_15

    .line 511
    invoke-interface {v0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v2, v0}, Lcom/google/firebase/firestore/Query;->endAt([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2

    :cond_15
    const-string v0, "endBefore"

    .line 514
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_16

    .line 515
    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {v2, p1}, Lcom/google/firebase/firestore/Query;->endBefore([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_16
    return-object v2

    :catch_0
    move-exception p1

    const-string v0, "An error occurred while parsing query arguments, this is most likely an error with this SDK."

    .line 519
    invoke-static {v1, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    return-object p1
.end method

.method private readFirestoreSettings(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings;
    .locals 8

    .line 312
    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    .line 314
    new-instance v0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    invoke-direct {v0}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;-><init>()V

    const-string v1, "persistenceEnabled"

    .line 315
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 316
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    .line 318
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 319
    invoke-static {}, Lcom/google/firebase/firestore/PersistentCacheSettings;->newBuilder()Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;

    move-result-object v1

    const-string v2, "cacheSizeBytes"

    .line 321
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    const-wide/32 v3, 0x6400000

    .line 322
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 323
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 325
    instance-of v4, v2, Ljava/lang/Long;

    if-eqz v4, :cond_0

    .line 326
    move-object v3, v2

    check-cast v3, Ljava/lang/Long;

    goto :goto_0

    .line 327
    :cond_0
    instance-of v4, v2, Ljava/lang/Integer;

    if-eqz v4, :cond_1

    .line 328
    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 331
    :cond_1
    :goto_0
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, -0x1

    cmp-long v2, v4, v6

    if-nez v2, :cond_2

    .line 332
    invoke-virtual {v1, v6, v7}, Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;->setSizeBytes(J)Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;

    goto :goto_1

    .line 334
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;->setSizeBytes(J)Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;

    .line 338
    :cond_3
    :goto_1
    invoke-virtual {v1}, Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;->build()Lcom/google/firebase/firestore/PersistentCacheSettings;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->setLocalCacheSettings(Lcom/google/firebase/firestore/LocalCacheSettings;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    goto :goto_2

    .line 340
    :cond_4
    invoke-static {}, Lcom/google/firebase/firestore/MemoryCacheSettings;->newBuilder()Lcom/google/firebase/firestore/MemoryCacheSettings$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/MemoryCacheSettings$Builder;->build()Lcom/google/firebase/firestore/MemoryCacheSettings;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->setLocalCacheSettings(Lcom/google/firebase/firestore/LocalCacheSettings;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    :cond_5
    :goto_2
    const-string v1, "host"

    .line 344
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 345
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->setHost(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    const-string v1, "sslEnabled"

    .line 347
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 349
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .line 348
    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->setSslEnabled(Z)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    .line 353
    :cond_6
    invoke-virtual {v0}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->build()Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    move-result-object p1

    return-object p1
.end method

.method private toArray(Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3

    .line 528
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_0

    .line 529
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    if-nez p1, :cond_1

    .line 533
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 536
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object p1

    .line 538
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "java.util.List was expected, unable to convert \'%s\' to an object array"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private writeDocumentChange(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/DocumentChange;)V
    .locals 3

    .line 124
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 127
    sget-object v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec$1;->$SwitchMap$com$google$firebase$firestore$DocumentChange$Type:[I

    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentChange;->getType()Lcom/google/firebase/firestore/DocumentChange$Type;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/firestore/DocumentChange$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const-string v1, "DocumentChangeType.removed"

    goto :goto_0

    :cond_1
    const-string v1, "DocumentChangeType.modified"

    goto :goto_0

    :cond_2
    const-string v1, "DocumentChangeType.added"

    :goto_0
    const-string v2, "type"

    .line 139
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentChange;->getDocument()Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/QueryDocumentSnapshot;->getData()Ljava/util/Map;

    move-result-object v1

    const-string v2, "data"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentChange;->getDocument()Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/QueryDocumentSnapshot;->getReference()Lcom/google/firebase/firestore/DocumentReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/DocumentReference;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "path"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentChange;->getOldIndex()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "oldIndex"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentChange;->getNewIndex()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "newIndex"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentChange;->getDocument()Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/firebase/firestore/QueryDocumentSnapshot;->getMetadata()Lcom/google/firebase/firestore/SnapshotMetadata;

    move-result-object p2

    const-string v1, "metadata"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    invoke-virtual {p0, p1, v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    return-void
.end method

.method private writeDocumentSnapshot(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/DocumentSnapshot;)V
    .locals 4

    .line 209
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 211
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentSnapshot;->getReference()Lcom/google/firebase/firestore/DocumentReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/firestore/DocumentReference;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "path"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentSnapshot;->exists()Z

    move-result v1

    const-string v2, "data"

    if-eqz v1, :cond_1

    .line 214
    sget-object v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->serverTimestampBehaviorHashMap:Ljava/util/Map;

    .line 215
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentSnapshot;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    if-eqz v1, :cond_0

    .line 217
    invoke-virtual {p2, v1}, Lcom/google/firebase/firestore/DocumentSnapshot;->getData(Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 219
    :cond_0
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentSnapshot;->getData()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 222
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    :goto_0
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentSnapshot;->getMetadata()Lcom/google/firebase/firestore/SnapshotMetadata;

    move-result-object v1

    const-string v2, "metadata"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    sget-object v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->serverTimestampBehaviorHashMap:Ljava/util/Map;

    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentSnapshot;->hashCode()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    invoke-virtual {p0, p1, v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    return-void
.end method

.method private writeLoadBundleTaskProgress(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/LoadBundleTaskProgress;)V
    .locals 3

    .line 180
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 182
    invoke-virtual {p2}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getBytesLoaded()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "bytesLoaded"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    invoke-virtual {p2}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getDocumentsLoaded()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "documentsLoaded"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    invoke-virtual {p2}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getTotalBytes()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "totalBytes"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    invoke-virtual {p2}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getTotalDocuments()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "totalDocuments"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    invoke-virtual {p2}, Lcom/google/firebase/firestore/LoadBundleTaskProgress;->getTaskState()Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;

    move-result-object p2

    .line 190
    sget-object v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec$1;->$SwitchMap$com$google$firebase$firestore$LoadBundleTaskProgress$TaskState:[I

    invoke-virtual {p2}, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->ordinal()I

    move-result p2

    aget p2, v1, p2

    const/4 v1, 0x1

    const-string v2, "running"

    if-eq p2, v1, :cond_2

    const/4 v1, 0x2

    if-eq p2, v1, :cond_1

    const/4 v1, 0x3

    if-eq p2, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v2, "error"

    goto :goto_0

    :cond_1
    const-string v2, "success"

    :cond_2
    :goto_0
    const-string p2, "taskState"

    .line 202
    invoke-interface {v0, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    invoke-virtual {p0, p1, v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    return-void
.end method

.method private writeQuerySnapshot(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/QuerySnapshot;)V
    .locals 8

    .line 150
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 151
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 152
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 153
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 155
    sget-object v4, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->serverTimestampBehaviorHashMap:Ljava/util/Map;

    .line 156
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    .line 158
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocuments()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/firebase/firestore/DocumentSnapshot;

    .line 159
    invoke-virtual {v6}, Lcom/google/firebase/firestore/DocumentSnapshot;->getReference()Lcom/google/firebase/firestore/DocumentReference;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/firebase/firestore/DocumentReference;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz v4, :cond_0

    .line 161
    invoke-virtual {v6, v4}, Lcom/google/firebase/firestore/DocumentSnapshot;->getData(Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 163
    :cond_0
    invoke-virtual {v6}, Lcom/google/firebase/firestore/DocumentSnapshot;->getData()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    :goto_1
    invoke-virtual {v6}, Lcom/google/firebase/firestore/DocumentSnapshot;->getMetadata()Lcom/google/firebase/firestore/SnapshotMetadata;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v4, "paths"

    .line 168
    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "documents"

    .line 169
    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "metadatas"

    .line 170
    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocumentChanges()Ljava/util/List;

    move-result-object v0

    const-string v2, "documentChanges"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getMetadata()Lcom/google/firebase/firestore/SnapshotMetadata;

    move-result-object v0

    const-string v2, "metadata"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->serverTimestampBehaviorHashMap:Ljava/util/Map;

    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->hashCode()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    invoke-virtual {p0, p1, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    return-void
.end method

.method private writeSnapshotMetadata(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/SnapshotMetadata;)V
    .locals 3

    .line 117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 118
    invoke-virtual {p2}, Lcom/google/firebase/firestore/SnapshotMetadata;->hasPendingWrites()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "hasPendingWrites"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    invoke-virtual {p2}, Lcom/google/firebase/firestore/SnapshotMetadata;->isFromCache()Z

    move-result p2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    const-string v1, "isFromCache"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    invoke-virtual {p0, p1, v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 4

    packed-switch p1, :pswitch_data_0

    .line 284
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 269
    :pswitch_0
    invoke-direct {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readFirestoreSettings(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    move-result-object p1

    return-object p1

    .line 267
    :pswitch_1
    invoke-direct {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readFirestoreQuery(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/Query;

    move-result-object p1

    return-object p1

    .line 265
    :pswitch_2
    invoke-direct {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readFirestoreInstance(Ljava/nio/ByteBuffer;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    return-object p1

    :pswitch_3
    const-wide/high16 p1, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 275
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    return-object p1

    :pswitch_4
    const-wide/high16 p1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 273
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    return-object p1

    :pswitch_5
    const-wide/high16 p1, 0x7ff8000000000000L    # Double.NaN

    .line 271
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    return-object p1

    .line 277
    :pswitch_6
    invoke-static {p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readSize(Ljava/nio/ByteBuffer;)I

    move-result p1

    .line 278
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p1, :cond_0

    .line 280
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    new-array p1, v1, [Ljava/lang/String;

    .line 282
    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    invoke-static {p1}, Lcom/google/firebase/firestore/FieldPath;->of([Ljava/lang/String;)Lcom/google/firebase/firestore/FieldPath;

    move-result-object p1

    return-object p1

    .line 263
    :pswitch_7
    invoke-static {}, Lcom/google/firebase/firestore/FieldPath;->documentId()Lcom/google/firebase/firestore/FieldPath;

    move-result-object p1

    return-object p1

    .line 257
    :pswitch_8
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 258
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    int-to-long p1, p1

    invoke-static {p1, p2}, Lcom/google/firebase/firestore/FieldValue;->increment(J)Lcom/google/firebase/firestore/FieldValue;

    move-result-object p1

    return-object p1

    .line 260
    :pswitch_9
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 261
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/google/firebase/firestore/FieldValue;->increment(D)Lcom/google/firebase/firestore/FieldValue;

    move-result-object p1

    return-object p1

    .line 237
    :pswitch_a
    new-instance p1, Lcom/google/firebase/Timestamp;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result p2

    invoke-direct {p1, v0, v1, p2}, Lcom/google/firebase/Timestamp;-><init>(JI)V

    return-object p1

    .line 255
    :pswitch_b
    invoke-static {}, Lcom/google/firebase/firestore/FieldValue;->serverTimestamp()Lcom/google/firebase/firestore/FieldValue;

    move-result-object p1

    return-object p1

    .line 253
    :pswitch_c
    invoke-static {}, Lcom/google/firebase/firestore/FieldValue;->delete()Lcom/google/firebase/firestore/FieldValue;

    move-result-object p1

    return-object p1

    .line 251
    :pswitch_d
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->toArray(Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/FieldValue;->arrayRemove([Ljava/lang/Object;)Lcom/google/firebase/firestore/FieldValue;

    move-result-object p1

    return-object p1

    .line 249
    :pswitch_e
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->toArray(Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/firestore/FieldValue;->arrayUnion([Ljava/lang/Object;)Lcom/google/firebase/firestore/FieldValue;

    move-result-object p1

    return-object p1

    .line 246
    :pswitch_f
    invoke-static {p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readBytes(Ljava/nio/ByteBuffer;)[B

    move-result-object p1

    .line 247
    invoke-static {p1}, Lcom/google/firebase/firestore/Blob;->fromBytes([B)Lcom/google/firebase/firestore/Blob;

    move-result-object p1

    return-object p1

    .line 242
    :pswitch_10
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/FirebaseFirestore;

    .line 243
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 244
    invoke-virtual {p1, p2}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p1

    return-object p1

    :pswitch_11
    const/16 p1, 0x8

    .line 239
    invoke-static {p2, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readAlignment(Ljava/nio/ByteBuffer;I)V

    .line 240
    new-instance p1, Lcom/google/firebase/firestore/GeoPoint;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v0

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v2

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/google/firebase/firestore/GeoPoint;-><init>(DD)V

    return-object p1

    .line 235
    :pswitch_12
    new-instance p1, Ljava/util/Date;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    invoke-direct {p1, v0, v1}, Ljava/util/Date;-><init>(J)V

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch -0x4c
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V
    .locals 3

    .line 61
    instance-of v0, p2, Ljava/util/Date;

    if-eqz v0, :cond_0

    const/16 v0, -0x4c

    .line 62
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 63
    check-cast p2, Ljava/util/Date;

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeLong(Ljava/io/ByteArrayOutputStream;J)V

    goto/16 :goto_0

    .line 64
    :cond_0
    instance-of v0, p2, Lcom/google/firebase/Timestamp;

    if-eqz v0, :cond_1

    const/16 v0, -0x44

    .line 65
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 66
    check-cast p2, Lcom/google/firebase/Timestamp;

    invoke-virtual {p2}, Lcom/google/firebase/Timestamp;->getSeconds()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeLong(Ljava/io/ByteArrayOutputStream;J)V

    .line 67
    invoke-virtual {p2}, Lcom/google/firebase/Timestamp;->getNanoseconds()I

    move-result p2

    invoke-static {p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeInt(Ljava/io/ByteArrayOutputStream;I)V

    goto/16 :goto_0

    .line 68
    :cond_1
    instance-of v0, p2, Lcom/google/firebase/firestore/GeoPoint;

    if-eqz v0, :cond_2

    const/16 v0, -0x4b

    .line 69
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    const/16 v0, 0x8

    .line 70
    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeAlignment(Ljava/io/ByteArrayOutputStream;I)V

    .line 71
    check-cast p2, Lcom/google/firebase/firestore/GeoPoint;

    invoke-virtual {p2}, Lcom/google/firebase/firestore/GeoPoint;->getLatitude()D

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeDouble(Ljava/io/ByteArrayOutputStream;D)V

    .line 72
    invoke-virtual {p2}, Lcom/google/firebase/firestore/GeoPoint;->getLongitude()D

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeDouble(Ljava/io/ByteArrayOutputStream;D)V

    goto/16 :goto_0

    .line 73
    :cond_2
    instance-of v0, p2, Lcom/google/firebase/firestore/DocumentReference;

    if-eqz v0, :cond_3

    const/16 v0, -0x4a

    .line 74
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 75
    check-cast p2, Lcom/google/firebase/firestore/DocumentReference;

    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentReference;->getFirestore()Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v0

    .line 76
    invoke-virtual {v0}, Lcom/google/firebase/firestore/FirebaseFirestore;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v1

    .line 77
    invoke-virtual {p0, p1, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 78
    invoke-virtual {p2}, Lcom/google/firebase/firestore/DocumentReference;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 81
    sget-object v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->firestoreInstanceCache:Ljava/util/HashMap;

    monitor-enter v1

    .line 83
    :try_start_0
    invoke-static {v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getCachedFirebaseFirestoreInstanceForKey(Lcom/google/firebase/firestore/FirebaseFirestore;)Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;

    move-result-object p2

    .line 84
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;->getDatabaseURL()Ljava/lang/String;

    move-result-object p2

    .line 85
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto/16 :goto_0

    :catchall_0
    move-exception p1

    .line 85
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    .line 87
    :cond_3
    instance-of v0, p2, Lcom/google/firebase/firestore/DocumentSnapshot;

    if-eqz v0, :cond_4

    .line 88
    check-cast p2, Lcom/google/firebase/firestore/DocumentSnapshot;

    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeDocumentSnapshot(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/DocumentSnapshot;)V

    goto/16 :goto_0

    .line 89
    :cond_4
    instance-of v0, p2, Lcom/google/firebase/firestore/QuerySnapshot;

    if-eqz v0, :cond_5

    .line 90
    check-cast p2, Lcom/google/firebase/firestore/QuerySnapshot;

    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeQuerySnapshot(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/QuerySnapshot;)V

    goto/16 :goto_0

    .line 91
    :cond_5
    instance-of v0, p2, Lcom/google/firebase/firestore/DocumentChange;

    if-eqz v0, :cond_6

    .line 92
    check-cast p2, Lcom/google/firebase/firestore/DocumentChange;

    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeDocumentChange(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/DocumentChange;)V

    goto/16 :goto_0

    .line 93
    :cond_6
    instance-of v0, p2, Lcom/google/firebase/firestore/LoadBundleTaskProgress;

    if-eqz v0, :cond_7

    .line 94
    check-cast p2, Lcom/google/firebase/firestore/LoadBundleTaskProgress;

    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeLoadBundleTaskProgress(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/LoadBundleTaskProgress;)V

    goto :goto_0

    .line 95
    :cond_7
    instance-of v0, p2, Lcom/google/firebase/firestore/SnapshotMetadata;

    if-eqz v0, :cond_8

    .line 96
    check-cast p2, Lcom/google/firebase/firestore/SnapshotMetadata;

    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeSnapshotMetadata(Ljava/io/ByteArrayOutputStream;Lcom/google/firebase/firestore/SnapshotMetadata;)V

    goto :goto_0

    .line 97
    :cond_8
    instance-of v0, p2, Lcom/google/firebase/firestore/Blob;

    if-eqz v0, :cond_9

    const/16 v0, -0x49

    .line 98
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 99
    check-cast p2, Lcom/google/firebase/firestore/Blob;

    invoke-virtual {p2}, Lcom/google/firebase/firestore/Blob;->toBytes()[B

    move-result-object p2

    invoke-static {p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeBytes(Ljava/io/ByteArrayOutputStream;[B)V

    goto :goto_0

    .line 100
    :cond_9
    instance-of v0, p2, Ljava/lang/Double;

    if-eqz v0, :cond_d

    .line 101
    move-object v0, p2

    check-cast v0, Ljava/lang/Double;

    .line 102
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_a

    const/16 p2, -0x3f

    .line 103
    invoke-virtual {p1, p2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    :cond_a
    const-wide/high16 v1, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 104
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    const/16 p2, -0x3d

    .line 105
    invoke-virtual {p1, p2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    :cond_b
    const-wide/high16 v1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 106
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/16 p2, -0x3e

    .line 107
    invoke-virtual {p1, p2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 109
    :cond_c
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 112
    :cond_d
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
