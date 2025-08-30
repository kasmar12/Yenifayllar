.class Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;
.super Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;
.source "GeneratedAndroidFirebaseFirestore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FirebaseFirestoreHostApiCodec"
.end annotation


# static fields
.field public static final INSTANCE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1594
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->INSTANCE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1597
    invoke-direct {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;-><init>()V

    return-void
.end method


# virtual methods
.method protected readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 0

    packed-switch p1, :pswitch_data_0

    .line 1629
    invoke-super {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 1627
    :pswitch_0
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;

    move-result-object p1

    return-object p1

    .line 1625
    :pswitch_1
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;

    move-result-object p1

    return-object p1

    .line 1623
    :pswitch_2
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;

    move-result-object p1

    return-object p1

    .line 1621
    :pswitch_3
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;

    move-result-object p1

    return-object p1

    .line 1619
    :pswitch_4
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;

    move-result-object p1

    return-object p1

    .line 1617
    :pswitch_5
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    move-result-object p1

    return-object p1

    .line 1615
    :pswitch_6
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    move-result-object p1

    return-object p1

    .line 1613
    :pswitch_7
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    move-result-object p1

    return-object p1

    .line 1611
    :pswitch_8
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;

    move-result-object p1

    return-object p1

    .line 1609
    :pswitch_9
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;

    move-result-object p1

    return-object p1

    .line 1607
    :pswitch_a
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;

    move-result-object p1

    return-object p1

    .line 1605
    :pswitch_b
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;

    move-result-object p1

    return-object p1

    .line 1603
    :pswitch_c
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch -0x80
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
    .locals 1

    .line 1635
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;

    if-eqz v0, :cond_0

    const/16 v0, 0x80

    .line 1636
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1637
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1638
    :cond_0
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;

    if-eqz v0, :cond_1

    const/16 v0, 0x81

    .line 1639
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1640
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1641
    :cond_1
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;

    if-eqz v0, :cond_2

    const/16 v0, 0x82

    .line 1642
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1643
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1644
    :cond_2
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;

    if-eqz v0, :cond_3

    const/16 v0, 0x83

    .line 1645
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1646
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1647
    :cond_3
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;

    if-eqz v0, :cond_4

    const/16 v0, 0x84

    .line 1648
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1649
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1650
    :cond_4
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    if-eqz v0, :cond_5

    const/16 v0, 0x85

    .line 1651
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1652
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1653
    :cond_5
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    if-eqz v0, :cond_6

    const/16 v0, 0x86

    .line 1654
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1655
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1656
    :cond_6
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    if-eqz v0, :cond_7

    const/16 v0, 0x87

    .line 1657
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1658
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 1659
    :cond_7
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;

    if-eqz v0, :cond_8

    const/16 v0, 0x88

    .line 1660
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1661
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 1662
    :cond_8
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;

    if-eqz v0, :cond_9

    const/16 v0, 0x89

    .line 1663
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1664
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 1665
    :cond_9
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;

    if-eqz v0, :cond_a

    const/16 v0, 0x8a

    .line 1666
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1667
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 1668
    :cond_a
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;

    if-eqz v0, :cond_b

    const/16 v0, 0x8b

    .line 1669
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1670
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 1671
    :cond_b
    instance-of v0, p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;

    if-eqz v0, :cond_c

    const/16 v0, 0x8c

    .line 1672
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1673
    check-cast p2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->toList()Ljava/util/ArrayList;

    move-result-object p2

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1675
    :cond_c
    invoke-super {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    :goto_0
    return-void

    :catchall_0
    move-exception p1

    .line 1673
    throw p1
.end method
