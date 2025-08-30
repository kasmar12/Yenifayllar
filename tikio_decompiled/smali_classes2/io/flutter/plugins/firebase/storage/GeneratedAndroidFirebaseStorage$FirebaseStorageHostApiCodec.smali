.class Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;
.super Lio/flutter/plugin/common/StandardMessageCodec;
.source "GeneratedAndroidFirebaseStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FirebaseStorageHostApiCodec"
.end annotation


# static fields
.field public static final INSTANCE:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 672
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->INSTANCE:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 674
    invoke-direct {p0}, Lio/flutter/plugin/common/StandardMessageCodec;-><init>()V

    return-void
.end method


# virtual methods
.method protected readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 0

    packed-switch p1, :pswitch_data_0

    .line 692
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 690
    :pswitch_0
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    move-result-object p1

    return-object p1

    .line 688
    :pswitch_1
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    move-result-object p1

    return-object p1

    .line 686
    :pswitch_2
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;

    move-result-object p1

    return-object p1

    .line 684
    :pswitch_3
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;

    move-result-object p1

    return-object p1

    .line 682
    :pswitch_4
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;

    move-result-object p1

    return-object p1

    .line 680
    :pswitch_5
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch -0x80
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V
    .locals 1

    .line 698
    instance-of v0, p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;

    if-eqz v0, :cond_0

    const/16 v0, 0x80

    .line 699
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 700
    check-cast p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 701
    :cond_0
    instance-of v0, p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;

    if-eqz v0, :cond_1

    const/16 v0, 0x81

    .line 702
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 703
    check-cast p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 704
    :cond_1
    instance-of v0, p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;

    if-eqz v0, :cond_2

    const/16 v0, 0x82

    .line 705
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 706
    check-cast p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 707
    :cond_2
    instance-of v0, p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;

    if-eqz v0, :cond_3

    const/16 v0, 0x83

    .line 708
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 709
    check-cast p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 710
    :cond_3
    instance-of v0, p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    if-eqz v0, :cond_4

    const/16 v0, 0x84

    .line 711
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 712
    check-cast p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 713
    :cond_4
    instance-of v0, p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    if-eqz v0, :cond_5

    const/16 v0, 0x85

    .line 714
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 715
    check-cast p2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->toList()Ljava/util/ArrayList;

    move-result-object p2

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 717
    :cond_5
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    :goto_0
    return-void

    :catchall_0
    move-exception p1

    .line 715
    throw p1
.end method
