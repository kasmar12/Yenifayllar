.class public interface abstract Lcom/google/firestore/v1/ListenRequestOrBuilder;
.super Ljava/lang/Object;
.source "ListenRequestOrBuilder.java"

# interfaces
.implements Lcom/google/protobuf/MessageLiteOrBuilder;


# virtual methods
.method public abstract containsLabels(Ljava/lang/String;)Z
.end method

.method public abstract getAddTarget()Lcom/google/firestore/v1/Target;
.end method

.method public abstract getDatabase()Ljava/lang/String;
.end method

.method public abstract getDatabaseBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getLabels()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getLabelsCount()I
.end method

.method public abstract getLabelsMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLabelsOrDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getLabelsOrThrow(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getRemoveTarget()I
.end method

.method public abstract getTargetChangeCase()Lcom/google/firestore/v1/ListenRequest$TargetChangeCase;
.end method

.method public abstract hasAddTarget()Z
.end method

.method public abstract hasRemoveTarget()Z
.end method
