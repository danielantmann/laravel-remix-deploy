<?php

namespace Tests\Feature\Api;

use Tests\TestCase;

class RemixTest extends TestCase
{
    public function test_validates_text_length(): void
    {
        // Too short
        $this->postJson('/api/remix', ['text' => 'too short'])
            ->assertStatus(422);

        // Too long
        $this->postJson('/api/remix', ['text' => str_repeat('a', 281)])
            ->assertStatus(422);

        // Missing text
        $this->postJson('/api/remix', [])
            ->assertStatus(422);

        // Non-string text (array)
        $this->postJson('/api/remix', ['text' => ['not', 'a', 'string']])
            ->assertStatus(422);
    }

    public function test_returns_four_variants(): void
    {
        $text = "3 reasons your social posts stall: unclear hook, too many hashtags, no CTA. Fix those and test weekly.";

        $res = $this->postJson('/api/remix', ['text' => $text])
            ->assertOk()
            ->assertJsonStructure(['variants'])
            ->json();

        $this->assertCount(4, $res['variants']);

        // Each should contain the original text, be a non-empty trimmed string, <=280 chars, and be sufficiently unique
        foreach ($res['variants'] as $variant) {
            $this->assertIsString($variant);
            $this->assertNotEmpty(trim($variant));
            $this->assertLessThanOrEqual(280, mb_strlen($variant));
            $this->assertStringContainsString($text, $variant);
        }

        // At least 2 variants are not exactly equal to the input
        $differentCount = count(array_filter($res['variants'], fn ($v) => $v !== $text));
        $this->assertGreaterThanOrEqual(2, $differentCount);

        // At least 3 of the 4 variants are unique (case-sensitive)
        $uniqueCount = count(array_unique($res['variants']));
        $this->assertGreaterThanOrEqual(3, $uniqueCount);
    }
}
