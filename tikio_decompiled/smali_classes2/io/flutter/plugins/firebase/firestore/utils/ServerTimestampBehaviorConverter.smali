.class public Lio/flutter/plugins/firebase/firestore/utils/ServerTimestampBehaviorConverter;
.super Ljava/lang/Object;
.source "ServerTimestampBehaviorConverter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toServerTimestampBehavior(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;
    .locals 4

    if-nez p0, :cond_0

    .line 16
    sget-object p0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->NONE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object p0

    :cond_0
    const/4 v0, -0x1

    .line 18
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, -0x74cfdad8

    const/4 v3, 0x1

    if-eq v1, v2, :cond_3

    const v2, -0x4bec4509

    if-eq v1, v2, :cond_2

    const v2, 0x33af38

    if-eq v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const-string v1, "none"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const/4 v0, 0x2

    goto :goto_0

    :cond_2
    const-string v1, "previous"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    const-string v1, "estimate"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const/4 v0, 0x0

    :cond_4
    :goto_0
    if-eqz v0, :cond_6

    if-eq v0, v3, :cond_5

    .line 25
    sget-object p0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->NONE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object p0

    .line 22
    :cond_5
    sget-object p0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->PREVIOUS:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object p0

    .line 20
    :cond_6
    sget-object p0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->ESTIMATE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object p0
.end method
