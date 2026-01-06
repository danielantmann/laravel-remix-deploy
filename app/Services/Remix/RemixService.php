<?php

namespace App\Services\Remix;

class RemixService
{
    /**
     * Generate 4 variants by adding prefixes/suffixes to the original text.
     *
     * Constraints:
     * - Include the original text in each variant
     * - Add different prefixes/suffixes (hooks, CTAs, etc.)
     * - Stay under 280 characters
     * - No external APIs
     */
    public function variants(string $text): array
    {
        // TODO (candidate): implement
        // Suggested approach:
        // - Define a few interesting prefixes (e.g. "Quick tip:", "Hot take:")
        // - Define a few call-to-action suffixes (e.g. "Try this today.")
        // - Combine them with the original text
        // - Ensure the resulting string is <= 280 chars

        $normalPrefixes = [
            "Hey",
            "Tip:",
            "Note:",
            "Alert:",
        ];

        $tinyPrefixes = [
            "·",
            "→",
            "✓",
            "★",
        ];

        $suffixes = [
            " Check.",
            " Go.",
            " Why?",
            " Share.",
        ];

        $variants = [];

        for ($i = 0; $i < 4; $i++) {

            $variant = trim($normalPrefixes[$i] . " " . $text . " " . $suffixes[$i]);

            if (mb_strlen($variant) <= 280) {
                $variants[] = $variant;
                continue;
            }

            $variant = trim($normalPrefixes[$i] . " " . $text);

            if (mb_strlen($variant) <= 280) {
                $variants[] = $variant;
                continue;
            }

            $variant = $tinyPrefixes[$i] . " " . $text;

            if (mb_strlen($variant) <= 280) {
                $variants[] = $variant;
                continue;
            }

            $variants[] = $text;
        }

        return $variants;
    }
}
