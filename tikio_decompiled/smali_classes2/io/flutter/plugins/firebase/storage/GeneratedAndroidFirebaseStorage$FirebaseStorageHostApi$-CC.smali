.class public final synthetic Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseStorage.java"


# direct methods
.method public static getCodec()Lio/flutter/plugin/common/MessageCodec;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/flutter/plugin/common/MessageCodec<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 833
    sget-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->INSTANCE:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;

    return-object v0
.end method

.method public static synthetic lambda$setup$0(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 850
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 851
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 852
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 853
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x2

    .line 854
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 855
    new-instance v3, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$1;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$1;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 868
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->getReferencebyPath(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$1(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 883
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 884
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 885
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 886
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 887
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$2;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$2;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 901
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 900
    :goto_0
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->setMaxOperationRetryTime(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$10(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 1180
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1181
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1182
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1183
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    const/4 v3, 0x2

    .line 1184
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 1185
    new-instance v3, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$11;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$11;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1201
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 1198
    :goto_0
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referenceGetData(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$11(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 9

    .line 1217
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1218
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1219
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v1, 0x1

    .line 1220
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    const/4 v1, 0x2

    .line 1221
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, [B

    const/4 v1, 0x3

    .line 1222
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;

    const/4 v1, 0x4

    .line 1223
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 1224
    new-instance v8, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$12;

    invoke-direct {v8, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$12;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1242
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    :goto_0
    move-object v7, p1

    move-object v2, p0

    .line 1237
    invoke-interface/range {v2 .. v8}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referencePutData(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;[BLio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$12(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 10

    .line 1258
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1259
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1260
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v1, 0x1

    .line 1261
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    const/4 v1, 0x2

    .line 1262
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ljava/lang/String;

    const/4 v1, 0x3

    .line 1263
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    const/4 v2, 0x4

    .line 1264
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;

    const/4 v2, 0x5

    .line 1265
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 1266
    new-instance v9, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$13;

    invoke-direct {v9, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$13;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    const/4 p2, 0x0

    if-nez v1, :cond_0

    move-object v6, p2

    goto :goto_0

    .line 1283
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    move-object v6, v0

    :goto_0
    if-nez p1, :cond_1

    move-object v8, p2

    goto :goto_1

    .line 1285
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    move-object v8, p1

    :goto_1
    move-object v2, p0

    .line 1279
    invoke-interface/range {v2 .. v9}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referencePutString(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Ljava/lang/String;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$13(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 9

    .line 1301
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1302
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1303
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v1, 0x1

    .line 1304
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    const/4 v1, 0x2

    .line 1305
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ljava/lang/String;

    const/4 v1, 0x3

    .line 1306
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;

    const/4 v1, 0x4

    .line 1307
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 1308
    new-instance v8, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$14;

    invoke-direct {v8, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$14;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1326
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    :goto_0
    move-object v7, p1

    move-object v2, p0

    .line 1321
    invoke-interface/range {v2 .. v8}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referencePutFile(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Ljava/lang/String;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$14(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 8

    .line 1342
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1343
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1344
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v1, 0x1

    .line 1345
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    const/4 v1, 0x2

    .line 1346
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Ljava/lang/String;

    const/4 v1, 0x3

    .line 1347
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 1348
    new-instance v7, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$15;

    invoke-direct {v7, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$15;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1365
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    :goto_0
    move-object v6, p1

    move-object v2, p0

    .line 1361
    invoke-interface/range {v2 .. v7}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referenceDownloadFile(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Ljava/lang/String;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$15(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 1381
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1382
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1383
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1384
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    const/4 v3, 0x2

    .line 1385
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;

    .line 1386
    new-instance v3, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$16;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$16;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 1399
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referenceUpdateMetadata(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$16(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 1414
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1415
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1416
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1417
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 1418
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$17;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$17;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1432
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 1431
    :goto_0
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->taskPause(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$17(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 1447
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1448
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1449
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1450
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 1451
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$18;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$18;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1465
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 1464
    :goto_0
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->taskResume(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$18(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 1480
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1481
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1482
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1483
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 1484
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$19;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$19;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1498
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 1497
    :goto_0
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->taskCancel(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$2(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 916
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 917
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 918
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 919
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 920
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$3;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 934
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 933
    :goto_0
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->setMaxUploadRetryTime(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$3(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 949
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 950
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 951
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 952
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 953
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$4;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$4;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 967
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 966
    :goto_0
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->setMaxDownloadRetryTime(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$4(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 982
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 983
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 984
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 985
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x2

    .line 986
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    .line 987
    new-instance v3, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$5;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$5;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1003
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 1000
    :goto_0
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->useStorageEmulator(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/String;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$5(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 1019
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1020
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1021
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1022
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    .line 1023
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$6;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$6;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 1036
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referenceDelete(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$6(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 1051
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1052
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1053
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1054
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    .line 1055
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$7;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$7;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 1068
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referenceGetDownloadURL(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$7(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 1083
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1084
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1085
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1086
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    .line 1087
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$8;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$8;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 1100
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referenceGetMetaData(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$8(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 1115
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1116
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1117
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1118
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    const/4 v3, 0x2

    .line 1119
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;

    .line 1120
    new-instance v3, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$9;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$9;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 1133
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referenceList(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static synthetic lambda$setup$9(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 1148
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1149
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 1150
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    const/4 v2, 0x1

    .line 1151
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    .line 1152
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$10;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$10;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 1165
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;->referenceListAll(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    return-void
.end method

.method public static setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V
    .locals 4

    .line 842
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 846
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v1

    const-string v2, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.getReferencebyPath"

    invoke-direct {v0, p0, v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 848
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_0

    .line 871
    :cond_0
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 875
    :goto_0
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 879
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.setMaxOperationRetryTime"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_1

    .line 881
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda10;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda10;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_1

    .line 904
    :cond_1
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 908
    :goto_1
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 912
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.setMaxUploadRetryTime"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_2

    .line 914
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_2

    .line 937
    :cond_2
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 941
    :goto_2
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 945
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.setMaxDownloadRetryTime"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_3

    .line 947
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda3;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_3

    .line 970
    :cond_3
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 974
    :goto_3
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 978
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.useStorageEmulator"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_4

    .line 980
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda4;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_4

    .line 1007
    :cond_4
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1011
    :goto_4
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1015
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referenceDelete"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_5

    .line 1017
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda5;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_5

    .line 1039
    :cond_5
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1043
    :goto_5
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1047
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referenceGetDownloadURL"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_6

    .line 1049
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda6;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda6;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_6

    .line 1071
    :cond_6
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1075
    :goto_6
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1079
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referenceGetMetaData"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_7

    .line 1081
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda7;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda7;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_7

    .line 1103
    :cond_7
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1107
    :goto_7
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1111
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referenceList"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_8

    .line 1113
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda8;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda8;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_8

    .line 1136
    :cond_8
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1140
    :goto_8
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1144
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referenceListAll"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_9

    .line 1146
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda9;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda9;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_9

    .line 1168
    :cond_9
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1172
    :goto_9
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1176
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referenceGetData"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_a

    .line 1178
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda11;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda11;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_a

    .line 1205
    :cond_a
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1209
    :goto_a
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1213
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referencePutData"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_b

    .line 1215
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda12;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda12;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_b

    .line 1246
    :cond_b
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1250
    :goto_b
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1254
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referencePutString"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_c

    .line 1256
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda13;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda13;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_c

    .line 1289
    :cond_c
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1293
    :goto_c
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1297
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referencePutFile"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_d

    .line 1299
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda14;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda14;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_d

    .line 1330
    :cond_d
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1334
    :goto_d
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1338
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referenceDownloadFile"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_e

    .line 1340
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda15;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda15;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_e

    .line 1369
    :cond_e
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1373
    :goto_e
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1377
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.referenceUpdateMetadata"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_f

    .line 1379
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda16;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda16;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_f

    .line 1402
    :cond_f
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1406
    :goto_f
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1410
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.taskPause"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_10

    .line 1412
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda17;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda17;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_10

    .line 1435
    :cond_10
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1439
    :goto_10
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1443
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.taskResume"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_11

    .line 1445
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda18;

    invoke-direct {v2, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda18;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_11

    .line 1468
    :cond_11
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 1472
    :goto_11
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    .line 1476
    invoke-static {}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v2

    const-string v3, "dev.flutter.pigeon.firebase_storage_platform_interface.FirebaseStorageHostApi.taskCancel"

    invoke-direct {v0, p0, v3, v2}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_12

    .line 1478
    new-instance p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda1;

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_12

    .line 1501
    :cond_12
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    :goto_12
    return-void
.end method
