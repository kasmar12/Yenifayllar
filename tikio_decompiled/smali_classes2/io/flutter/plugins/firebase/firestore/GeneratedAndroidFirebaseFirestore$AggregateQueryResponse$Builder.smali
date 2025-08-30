.class public final Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseFirestore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private field:Ljava/lang/String;

.field private type:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;

.field private value:Ljava/lang/Double;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1533
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;
    .locals 2

    .line 1557
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;-><init>()V

    .line 1558
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->type:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;->setType(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;)V

    .line 1559
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->field:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;->setField(Ljava/lang/String;)V

    .line 1560
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->value:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;->setValue(Ljava/lang/Double;)V

    return-object v0
.end method

.method public setField(Ljava/lang/String;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;
    .locals 0

    .line 1545
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->field:Ljava/lang/String;

    return-object p0
.end method

.method public setType(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;
    .locals 0

    .line 1538
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->type:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;

    return-object p0
.end method

.method public setValue(Ljava/lang/Double;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;
    .locals 0

    .line 1552
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->value:Ljava/lang/Double;

    return-object p0
.end method
