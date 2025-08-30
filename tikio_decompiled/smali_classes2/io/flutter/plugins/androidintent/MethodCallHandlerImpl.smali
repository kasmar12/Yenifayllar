.class public final Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;
.super Ljava/lang/Object;
.source "MethodCallHandlerImpl.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# static fields
.field private static final TAG:Ljava/lang/String; = "MethodCallHandlerImpl"


# instance fields
.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;

.field private final sender:Lio/flutter/plugins/androidintent/IntentSender;


# direct methods
.method constructor <init>(Lio/flutter/plugins/androidintent/IntentSender;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->sender:Lio/flutter/plugins/androidintent/IntentSender;

    return-void
.end method

.method private static convertAction(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 118
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "action_voice"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x4

    goto :goto_0

    :sswitch_1
    const-string v1, "action_view"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x3

    goto :goto_0

    :sswitch_2
    const-string v1, "settings"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v0, 0x2

    goto :goto_0

    :sswitch_3
    const-string v1, "action_application_details_settings"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v0, 0x1

    goto :goto_0

    :sswitch_4
    const-string v1, "action_location_source_settings"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_0

    :cond_5
    const/4 v0, 0x0

    :goto_0
    packed-switch v0, :pswitch_data_0

    return-object p0

    :pswitch_0
    const-string p0, "android.intent.action.VOICE_COMMAND"

    return-object p0

    :pswitch_1
    const-string p0, "android.intent.action.VIEW"

    return-object p0

    :pswitch_2
    const-string p0, "android.settings.SETTINGS"

    return-object p0

    :pswitch_3
    const-string p0, "android.settings.APPLICATION_DETAILS_SETTINGS"

    return-object p0

    :pswitch_4
    const-string p0, "android.settings.LOCATION_SOURCE_SETTINGS"

    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x622942da -> :sswitch_4
        -0x446fb208 -> :sswitch_3
        0x5582bc23 -> :sswitch_2
        0x5e66e70e -> :sswitch_1
        0x6e78c1e9 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static convertArguments(Ljava/util/Map;)Landroid/os/Bundle;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .line 135
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    if-nez p0, :cond_0

    return-object v0

    .line 139
    :cond_0
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 140
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 141
    invoke-static {v3}, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->isStringArrayList(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v4

    .line 142
    invoke-static {v3}, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->isIntegerArrayList(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v5

    .line 143
    invoke-static {v3}, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->isStringKeyedMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v6

    .line 144
    instance-of v7, v3, Ljava/lang/Integer;

    if-eqz v7, :cond_1

    .line 145
    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_0

    .line 146
    :cond_1
    instance-of v7, v3, Ljava/lang/String;

    if-eqz v7, :cond_2

    .line 147
    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 148
    :cond_2
    instance-of v7, v3, Ljava/lang/Boolean;

    if-eqz v7, :cond_3

    .line 149
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 150
    :cond_3
    instance-of v7, v3, Ljava/lang/Double;

    if-eqz v7, :cond_4

    .line 151
    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->putDouble(Ljava/lang/String;D)V

    goto :goto_0

    .line 152
    :cond_4
    instance-of v7, v3, Ljava/lang/Long;

    if-eqz v7, :cond_5

    .line 153
    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto :goto_0

    .line 154
    :cond_5
    instance-of v7, v3, [B

    if-eqz v7, :cond_6

    .line 155
    check-cast v3, [B

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    goto :goto_0

    .line 156
    :cond_6
    instance-of v7, v3, [I

    if-eqz v7, :cond_7

    .line 157
    check-cast v3, [I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    goto :goto_0

    .line 158
    :cond_7
    instance-of v7, v3, [J

    if-eqz v7, :cond_8

    .line 159
    check-cast v3, [J

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    goto :goto_0

    .line 160
    :cond_8
    instance-of v7, v3, [D

    if-eqz v7, :cond_9

    .line 161
    check-cast v3, [D

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putDoubleArray(Ljava/lang/String;[D)V

    goto/16 :goto_0

    :cond_9
    if-eqz v5, :cond_a

    .line 163
    invoke-virtual {v0, v2, v5}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto/16 :goto_0

    :cond_a
    if-eqz v4, :cond_b

    .line 165
    invoke-virtual {v0, v2, v4}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto/16 :goto_0

    :cond_b
    if-eqz v6, :cond_c

    .line 167
    invoke-static {v6}, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->convertArguments(Ljava/util/Map;)Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto/16 :goto_0

    .line 169
    :cond_c
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unsupported type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_d
    return-object v0
.end method

.method private static isIntegerArrayList(Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 176
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 177
    instance-of v1, p0, Ljava/util/ArrayList;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 180
    :cond_0
    check-cast p0, Ljava/util/ArrayList;

    .line 181
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 182
    instance-of v3, v1, Ljava/lang/Integer;

    if-nez v3, :cond_1

    return-object v2

    .line 185
    :cond_1
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private static isStringArrayList(Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 192
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 193
    instance-of v1, p0, Ljava/util/ArrayList;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 196
    :cond_0
    check-cast p0, Ljava/util/ArrayList;

    .line 197
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 198
    instance-of v3, v1, Ljava/lang/String;

    if-nez v3, :cond_1

    return-object v2

    .line 201
    :cond_1
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private static isStringKeyedMap(Ljava/lang/Object;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation

    .line 208
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 209
    instance-of v1, p0, Ljava/util/Map;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 212
    :cond_0
    check-cast p0, Ljava/util/Map;

    .line 213
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 214
    instance-of v4, v3, Ljava/lang/String;

    if-nez v4, :cond_2

    return-object v2

    .line 217
    :cond_2
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 219
    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_3
    return-object v0
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 11

    const-string v0, "action"

    .line 80
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->convertAction(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v0, "flags"

    .line 81
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/Integer;

    const-string v0, "category"

    .line 82
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    const-string v0, "data"

    .line 83
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 84
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v10, 0x0

    if-eqz v0, :cond_0

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    move-object v5, v0

    goto :goto_0

    :cond_0
    move-object v5, v10

    :goto_0
    const-string v0, "arguments"

    .line 85
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 86
    invoke-static {v0}, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->convertArguments(Ljava/util/Map;)Landroid/os/Bundle;

    move-result-object v6

    const-string v0, "package"

    .line 87
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    const-string v0, "componentName"

    .line 88
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v7, :cond_1

    if-eqz v0, :cond_1

    .line 92
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 93
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 94
    new-instance v1, Landroid/content/ComponentName;

    invoke-direct {v1, v7, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v8, v1

    goto :goto_1

    :cond_1
    move-object v8, v10

    :goto_1
    const-string v0, "type"

    .line 96
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Ljava/lang/String;

    .line 98
    iget-object v1, p0, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->sender:Lio/flutter/plugins/androidintent/IntentSender;

    .line 99
    invoke-virtual/range {v1 .. v9}, Lio/flutter/plugins/androidintent/IntentSender;->buildIntent(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Landroid/net/Uri;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ComponentName;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 102
    iget-object v1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    const-string v2, "launch"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 103
    iget-object p1, p0, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->sender:Lio/flutter/plugins/androidintent/IntentSender;

    invoke-virtual {p1, v0}, Lio/flutter/plugins/androidintent/IntentSender;->send(Landroid/content/Intent;)V

    .line 105
    invoke-interface {p2, v10}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    .line 106
    :cond_2
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    const-string v1, "canResolveActivity"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 107
    iget-object p1, p0, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->sender:Lio/flutter/plugins/androidintent/IntentSender;

    invoke-virtual {p1, v0}, Lio/flutter/plugins/androidintent/IntentSender;->canResolveActivity(Landroid/content/Intent;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    .line 109
    :cond_3
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :goto_2
    return-void
.end method

.method startListening(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 2

    .line 49
    iget-object v0, p0, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    if-eqz v0, :cond_0

    const-string v0, "MethodCallHandlerImpl"

    const-string v1, "Setting a method call handler before the last was disposed."

    .line 50
    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    invoke-virtual {p0}, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->stopListening()V

    .line 54
    :cond_0
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    const-string v1, "plugins.flutter.io/android_intent"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 55
    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method stopListening()V
    .locals 2

    .line 64
    iget-object v0, p0, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    if-nez v0, :cond_0

    const-string v0, "MethodCallHandlerImpl"

    const-string v1, "Tried to stop listening when no methodChannel had been initialized."

    .line 65
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 69
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 70
    iput-object v1, p0, Lio/flutter/plugins/androidintent/MethodCallHandlerImpl;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    return-void
.end method
