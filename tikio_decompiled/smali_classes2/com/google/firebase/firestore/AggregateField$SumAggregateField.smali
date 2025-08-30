.class public Lcom/google/firebase/firestore/AggregateField$SumAggregateField;
.super Lcom/google/firebase/firestore/AggregateField;
.source "AggregateField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/AggregateField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SumAggregateField"
.end annotation


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/FieldPath;)V
    .locals 2

    const-string v0, "sum"

    const/4 v1, 0x0

    .line 203
    invoke-direct {p0, p1, v0, v1}, Lcom/google/firebase/firestore/AggregateField;-><init>(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/String;Lcom/google/firebase/firestore/AggregateField$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firebase/firestore/FieldPath;Lcom/google/firebase/firestore/AggregateField$1;)V
    .locals 0

    .line 201
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/AggregateField$SumAggregateField;-><init>(Lcom/google/firebase/firestore/FieldPath;)V

    return-void
.end method
