package com.elitemastereric.resourcetrees;

import net.minecraft.advancements.AdvancementHolder;
import net.minecraft.advancements.FrameType;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.ItemStack;
import net.minecraft.advancements.Advancement;
import com.elitemastereric.resourcetrees.common.ModCreativeTab;
import com.elitemastereric.resourcetrees.common.blocks.ModBlocks;
import com.elitemastereric.resourcetrees.common.items.ModItems;
import net.pickhaxe.datagen.DataGenerator;
import net.pickhaxe.core.Environment;
import java.util.function.Consumer;

class ResourceTreesDataGenerator extends DataGenerator {
  public override function onGenerateAdvancements(consumer:Consumer<AdvancementHolder>):Void {
    var root:AdvancementHolder = Advancement_Builder.advancement()
      .display(new ItemStack(ModItems.GOLD_SAPLING),
        Component.translatable("advancement.resourcetrees"),
        Component.translatable("advancement.resourcetrees.desc"),
        new ResourceLocation("textures/gui/advancements/backgrounds/dirt.png"),
        FrameType.TASK,
        false,
        false,
        false)
      .save(consumer, '${ResourceTreesMod.MOD_ID}:root');
  }
}