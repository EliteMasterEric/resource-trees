package com.elitemastereric.resourcetrees.common.worldgen.grower;

import net.minecraft.resources.ResourceKey;
import net.minecraft.util.RandomSource;
import net.minecraft.world.level.block.grower.AbstractTreeGrower;
import net.minecraft.world.level.levelgen.feature.ConfiguredFeature;
import com.elitemastereric.resourcetrees.common.worldgen.features.TreeFeatures;

class GoldTreeGrower extends AbstractTreeGrower {
    public overload function getConfiguredFeature(randomSource:RandomSource, hasFlowers:Bool):ResourceKey<ConfiguredFeature> {
        return TreeFeatures.GOLD_TREE;
    }
}